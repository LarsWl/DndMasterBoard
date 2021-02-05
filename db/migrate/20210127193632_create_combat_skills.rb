class CreateCombatSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :combat_skills do |t|
      t.string :name, null: false, default: ''
      t.string :description, default: ''
      t.integer :hit_modifier, default: 0
      t.string :damage, default: ''

      t.bigint :character_id
      t.string :character_type

      t.timestamps
    end
  end
end
