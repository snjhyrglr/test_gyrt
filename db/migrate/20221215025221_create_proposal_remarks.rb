class CreateProposalRemarks < ActiveRecord::Migration[7.0]
  def change
    create_table :proposal_remarks do |t|
      t.references :gyrt_proposal#, null: false, foreign_key: true
      t.string :remark
      t.string :remark_type
      t.string :status

      t.timestamps
    end
  end
end
