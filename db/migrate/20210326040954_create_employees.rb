class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :lastname
      t.integer :phone
      t.string :email
      t.string :position
      t.decimal :salary


      t.timestamps
    end
  end
end
