class CreateRaces < ActiveRecord::Migration[6.1]
  def change
    create_table :races do |t|
      t.string :name, default: ''
      t.string :description, default: ''

      t.timestamps
    end
  end
end
