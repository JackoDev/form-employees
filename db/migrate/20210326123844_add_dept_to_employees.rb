class AddDeptToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :department, :string
  end
end
