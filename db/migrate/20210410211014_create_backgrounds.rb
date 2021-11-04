class CreateBackgrounds < ActiveRecord::Migration[6.1]
  def change
    create_table :backgrounds do |t|
      t.string :name, default: false
      t.string :description, default: false
      t.string :proficient_skills, array: true, default: []
      t.string :languages, array: true, default: []
      t.string :personalization, default: ''

      t.timestamps
    end
  end
end
