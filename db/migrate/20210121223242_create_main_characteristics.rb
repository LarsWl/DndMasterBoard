class CreateMainCharacteristics < ActiveRecord::Migration[6.1]
  def change
    create_table :main_characteristics do |t|
      t.string :name
      t.integer :value
      t.integer :modifier
      t.string :label
      t.integer :position
      t.integer :code

      t.bigint :characterized_id
      t.string :characterized_type

      t.timestamps
    end
  end
end
