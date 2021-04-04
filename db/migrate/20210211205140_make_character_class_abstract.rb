class MakeCharacterClassAbstract < ActiveRecord::Migration[6.1]
  def change
    rename_table :characters, :master_characters

    remove_column :master_characters, :type, :string

    create_table :enemies do |t|
      t.string :name, null: false, default: ''
      t.string :description, null: false, default: ''
      t.string :notes, null: false, default: ''
      t.integer :experience
      t.float :level

      t.belongs_to :act
      t.belongs_to :campaign

      t.timestamps
    end
  end
end