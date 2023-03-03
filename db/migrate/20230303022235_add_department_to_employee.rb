class AddDepartmentToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_reference :departments, :employee, null: false, foreign_key: true
  end
end
