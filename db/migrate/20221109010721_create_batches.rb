class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.integer :quote_year
      t.string :issuing_office
      t.string :quote_no
      t.references :cooperative#, null: false, foreign_key: true
      t.decimal :total_gross_prem, precision: 15, scale: 2
      t.decimal :total_coop_sf, precision: 15, scale: 2
      t.decimal :total_agent_sf, precision: 15, scale: 2
      t.decimal :total_net_prem, precision: 15, scale: 2

      t.timestamps
    end
  end
end
