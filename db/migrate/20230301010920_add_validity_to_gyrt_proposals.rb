class AddValidityToGyrtProposals < ActiveRecord::Migration[7.0]
  def change
    add_column :gyrt_proposals, :validity, :date
    add_column :gyrt_proposals, :is_valid, :boolean
  end
end
