class CreateGyrtRateMultipliers < ActiveRecord::Migration[7.0]
  def change
    create_table :gyrt_rate_multipliers do |t|
      t.references :benefit, null: false, foreign_key: true
      t.integer :min_count
      t.integer :max_count
      t.decimal :rate, precision: 3, scale: 1

      t.timestamps
    end
  end
end
