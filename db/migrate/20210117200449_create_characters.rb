class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name, null: false, default: ''
      t.string :description, null: false, default: ''
      t.string :notes, null: false, default: ''

      t.string :type

      t.belongs_to :act
      t.belongs_to :campaign

      t.timestamps
    end
  end
end
