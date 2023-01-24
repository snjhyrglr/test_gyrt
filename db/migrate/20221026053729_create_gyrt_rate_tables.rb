class CreateGyrtRateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :gyrt_rate_tables do |t|
      t.references :gyrt_proposal#, null: false, foreign_key: true
      t.references :gyrt_rate, null: false, foreign_key: true
      t.references :cooperative, null: false, foreign_key: true
      t.integer :count
      t.decimal :qx, precision: 10, scale: 4

      t.timestamps
    end
  end
end
