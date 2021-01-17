class CreateSkills < ActiveRecord::Migration[6.1]
  def change
    create_table :skills do |t|
      t.string :name, null: false, default: ''
      t.string :description, null: false, default: ''
      t.integer :kind, default: 0

      t.belongs_to :character

      t.timestamps
    end
  end
end
