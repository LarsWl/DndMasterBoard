class CreateActCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :act_characters do |t|
      t.belongs_to :act
      t.belongs_to :character

      t.timestamps
    end
  end
end
