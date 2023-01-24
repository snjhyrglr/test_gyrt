class CreateGyrtProposals < ActiveRecord::Migration[7.0]
  def change
    create_table :gyrt_proposals do |t|
      t.references :cooperative#, null: false, foreign_key: true
      t.string :incharge_name
      t.string :inchage_position
      t.string :proposal_no
      t.integer :new_min_age
      t.integer :new_max_age
      t.integer :old_min_age
      t.integer :old_max_age
      t.integer :ave_age
      t.integer :members_count
      t.decimal :total_premium, precision: 10, scale: 2
      t.decimal :coop_sf, precision: 10, scale: 2
      t.decimal :agent_sf, precision: 10, scale: 2
      t.boolean :actuarial_approval_status
      t.boolean :underwriting_approval_status
      t.boolean :claims_approval_status
      t.boolean :agent_coop_approval_status

      t.timestamps
    end
  end
end
