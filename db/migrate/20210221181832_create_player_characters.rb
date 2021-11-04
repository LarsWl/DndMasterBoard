class CreatePlayerCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :player_characters do |t|
      t.string :name, default: '', null: false
      t.string :history, default: ''
      t.string :description, default: ''
      t.integer :max_hp
      t.integer :current_hp
      t.integer :level, default: 1
      t.integer :available_points, default: 0

      t.belongs_to :character_class
      t.belongs_to :race
      t.belongs_to :user

      t.timestamps
    end
  end
end
