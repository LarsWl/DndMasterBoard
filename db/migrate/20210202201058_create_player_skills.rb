class CreatePlayerSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :player_skills do |t|
      t.string :name
      t.integer :modifier, null: false, default: 0
      t.boolean :proficiency, default: false

      t.belongs_to :character
      t.belongs_to :main_characteristic

      t.timestamps
    end
  end
end
