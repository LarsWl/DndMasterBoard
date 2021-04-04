class CreateCharacterClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :character_classes do |t|
      t.string :name, default: ''
      t.string :hit_dice, default: ''
      t.string :description, default: ''

      t.timestamps
    end
  end
end
