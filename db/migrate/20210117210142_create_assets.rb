class CreateAssets < ActiveRecord::Migration[6.1]
  def change
    create_table :assets do |t|
      t.string :file
      t.string :filename, null: false, default: ''

      t.bigint :assetable_id
      t.string :assetable_type

      t.timestamps
    end
  end
end
