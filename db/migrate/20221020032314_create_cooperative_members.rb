class CreateCooperativeMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :cooperative_members do |t|
      t.references :cooperative#, null: false, foreign_key: true
      t.references :member#, null: false, foreign_key: true
      t.date :membership_date
      t.boolean :old_member


      t.timestamps
    end
  end
end
