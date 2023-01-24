class CreateGyrtBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :gyrt_batches do |t|
      t.references :cooperative#, null: false, foreign_key: true
      t.references :matrix#, null: false, foreign_key: true
      t.string :batch_name
      t.decimal :total_gross_prem, precision: 15, scale: 2
      t.decimal :total_coop_sf, precision: 15, scale: 2
      t.decimal :total_net_prem, precision: 15, scale: 2
      t.integer :members_count
      t.integer :denied_count
      t.date :effective_date
      t.date :expiry_date
      t.integer :terms

      t.timestamps
    end
  end
end
