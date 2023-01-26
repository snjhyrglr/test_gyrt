class CreateProposalRequirements < ActiveRecord::Migration[7.0]
  def change
    create_table :proposal_requirements do |t|
      t.references :proposal, polymorphic: true#, null: false
      t.references :requirement, polymorphic: true#, null: false
      t.boolean :active

      t.timestamps
    end
  end
end
