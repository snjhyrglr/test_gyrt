class CreateBatchItems < ActiveRecord::Migration[7.0]
  def change
    create_table :batch_items do |t|
      t.references :batch#, null: false, foreign_key: true
      t.references :cooperative#, null: false, foreign_key: true
      t.references :member#, null: false, foreign_key: true
      t.integer :age
      t.decimal :sum_insured, precision: 10, scale: 2
      t.date :effective_date
      t.date :expiry_date
      t.integer :terms
      t.decimal :gross_prem, precision: 10, scale: 2
      t.string :status

      t.timestamps
    end
  end
end
