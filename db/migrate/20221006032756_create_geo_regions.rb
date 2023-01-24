class CreateGeoRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :geo_regions do |t|
      t.string :name
      t.string :psgc_code

      t.timestamps
    end
  end
end
