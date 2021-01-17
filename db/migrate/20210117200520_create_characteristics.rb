class CreateCharacteristics < ActiveRecord::Migration[6.1]
  def change
    create_table :characteristics do |t|
      t.string :name
      t.integer :value
      t.integer :modifier

      t.bigint :characterized_id
      t.string :characterized_type

      t.timestamps
    end
  end
end
