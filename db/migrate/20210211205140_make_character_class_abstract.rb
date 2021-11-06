class MakeCharacterClassAbstract < ActiveRecord::Migration[6.1]
  def change
    create_table :master_characters do |t|
      t.string :name, null: false, default: ''
      t.string :description, null: false, default: ''
      t.string :notes, null: false, default: ''

      t.belongs_to :act
      t.belongs_to :campaign
      t.belongs_to :user

      t.timestamps
    end

    create_table :enemies do |t|
      t.string :name, null: false, default: ''
      t.string :description, null: false, default: ''
      t.string :notes, null: false, default: ''
      t.integer :experience
      t.float :level

      t.belongs_to :act
      t.belongs_to :campaign
      t.belongs_to :user

      t.timestamps
    end
  end
end