# frozen_string_literal: true

class CreateActs < ActiveRecord::Migration[6.1]
  def change
    create_table :acts do |t|
      t.string :name, null: false, default: ''
      t.string :description
      t.string :notes
      t.string :plot

      t.integer :position

      t.belongs_to :chapter

      t.timestamps
    end
  end
end
