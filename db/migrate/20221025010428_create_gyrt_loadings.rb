class CreateGyrtLoadings < ActiveRecord::Migration[7.0]
  def change
    create_table :gyrt_loadings do |t|
      t.string :name
      t.decimal :rate, precision: 10, scale: 4

      t.timestamps
    end
  end
end
