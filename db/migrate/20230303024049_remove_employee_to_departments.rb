class RemoveEmployeeToDepartments < ActiveRecord::Migration[7.0]
  def change
    remove_column :departments, :employee_id, null: false, foreign_key: true
  end
end
