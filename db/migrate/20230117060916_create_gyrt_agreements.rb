class CreateGyrtAgreements < ActiveRecord::Migration[7.0]
  def change
    create_table :gyrt_agreements do |t|
      t.references :cooperative, null: false, foreign_key: true
      t.string :product_name
      t.integer :old_min_age
      t.integer :old_max_age
      t.integer :new_min_age
      t.integer :new_max_age
      t.decimal :prem_rate, precision: 10, scale: 2
      t.string :rate_type
      t.decimal :coop_sf, precision: 10, scale: 2
      t.decimal :agent_sf, precision: 10, scale: 2
      t.references :gyrt_proposal, null: false, foreign_key: true
      t.string :policy_anniv_type
      t.string :min_enrollees_count
      t.boolean :signed_by_coop
      t.boolean :notarized
      t.boolean :ids_upload
      t.boolean :agent_coop_status
      

      t.timestamps
    end
  end
end
