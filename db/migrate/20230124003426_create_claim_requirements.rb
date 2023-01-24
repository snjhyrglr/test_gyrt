class CreateClaimRequirements < ActiveRecord::Migration[7.0]
  def change
    create_table :claim_requirements do |t|
      t.text :requirement
      t.text :description
      t.string :requirement_type

      t.timestamps
    end
  end
end
