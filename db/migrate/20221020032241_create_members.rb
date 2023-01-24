class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.date :birth_date
      t.string :gender

      t.timestamps
    end
  end
end
