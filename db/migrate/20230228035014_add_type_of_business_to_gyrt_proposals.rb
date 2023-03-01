class AddTypeOfBusinessToGyrtProposals < ActiveRecord::Migration[7.0]
  def change
    add_column :gyrt_proposals, :type_of_business, :string
  end
end
