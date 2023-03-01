class AddTypeOfBusinessToGyrtAgreements < ActiveRecord::Migration[7.0]
  def change
    add_column :gyrt_agreements, :type_of_business, :string
  end
end
