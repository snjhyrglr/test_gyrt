class AddPolicyAnnivTypeToGyrtProposal < ActiveRecord::Migration[7.0]
  def change
    add_column :gyrt_proposals, :policy_anniv_type, :string
  end
end
