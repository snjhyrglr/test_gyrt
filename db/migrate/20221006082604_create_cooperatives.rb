class CreateCooperatives < ActiveRecord::Migration[7.0]
  def change
    create_table :cooperatives do |t|
      t.string :name
      t.references :geo_region#, null: false, foreign_key: true
      t.references :geo_province#, null: false, foreign_key: true
      t.references :geo_municipality#, null: false, foreign_key: true
      t.references :geo_barangay#, null: false, foreign_key: true
      t.string :address
      t.references :coop_category#, null: false, foreign_key: true
      t.references :coop_type#, null: false, foreign_key: true
      t.string :status
      t.string :asset_size
      t.string :registration_no
      t.decimal :total_asset, precision: 20, scale: 2

      t.timestamps
    end
  end
end
