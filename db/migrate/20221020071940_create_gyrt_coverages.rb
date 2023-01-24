class CreateGyrtCoverages < ActiveRecord::Migration[7.0]
  def change
    create_table :gyrt_coverages do |t|
      t.references :gyrt_batch, null: false, foreign_key: true
      t.references :member#, null: false, foreign_key: true
      t.integer :age
      t.decimal :gross_prem, precision: 15, scale: 2
      t.string :status

      t.timestamps
    end
  end
end
