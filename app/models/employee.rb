class Employee < ApplicationRecord
  validates :name, presence: true
  validates :lastname, presence: true
  validates :phone, presence: true, numericality: true,
                        length: { minimum: 10, maximum: 11 },
                        uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                        uniqueness: { case_sensitive: false },
                        length: { maximum: 105 },
                        format: { with: VALID_EMAIL_REGEX }
  validates :position, presence: true
  validates :salary, presence: true, numericality: true
  validates :department, presence: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Employee.create! row.to_hash
    end
  end

  def self.to_csv
    headers = %w{ name lastname phone email position salary department }
    CSV.generate(headers: true) do |csv|
      csv << headers

      all.each do |emp|
        csv << emp.attributes.values_at(*headers)
      end
    end
  end
end
