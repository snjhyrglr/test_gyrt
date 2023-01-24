class CreateGyrtRates < ActiveRecord::Migration[7.0]
  def change
    create_table :gyrt_rates do |t|
      t.references :benefit, null: false, foreign_key: true
      t.integer :age
      t.decimal :rate, precision: 8, scale: 6
      t.string :rate_type

      t.timestamps
    end
  end
end
