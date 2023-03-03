class AddIdTypeAndIdNumberToGyrtProposals < ActiveRecord::Migration[7.0]
  def change
    add_column :gyrt_proposals, :id_type, :string
    add_column :gyrt_proposals, :id_no, :string
  end
end
