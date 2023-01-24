class CreateGyrtProposalBenefits < ActiveRecord::Migration[7.0]
  def change
    create_table :gyrt_proposal_benefits do |t|
      t.references :gyrt_proposal#, null: false, foreign_key: true
      t.references :benefit#, null: false, foreign_key: true
      t.decimal :sum_insured, precision: 10, scale: 2
      t.decimal :base_prem, precision: 10, scale: 2

      t.timestamps
    end
  end
end
