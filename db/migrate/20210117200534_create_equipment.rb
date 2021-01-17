class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      t.string :name, null: false, default: ''
      t.string :description
      t.integer :cost, null: false, default: 0
      t.integer :weight, null: false

      t.timestamps
    end
  end
end
