class CreateAgents < ActiveRecord::Migration[7.0]
  def change
    create_table :agents do |t|
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :suffix
      t.date :birthdate
      t.string :username
      t.string :position
      t.boolean :status
      t.date :date_hired
      t.boolean :life_licensed
      t.boolean :nonlife_licensed


      t.timestamps
    end
  end
end
