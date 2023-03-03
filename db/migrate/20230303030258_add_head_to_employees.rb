class AddHeadToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :is_head, :boolean
  end
end
