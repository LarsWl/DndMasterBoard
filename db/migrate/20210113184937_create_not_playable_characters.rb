class CreateNotPlayableCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :not_playable_characters do |t|
      t.string :name, null: false, default: ''
      t.string :description
      t.string :history
      t.string :notes
      t.string :characteristics
      t.string :skills

      t.belongs_to :campaign
      t.belongs_to :act

      t.timestamps
    end
  end
end
