# frozen_string_literal: true

class CreateChapters < ActiveRecord::Migration[6.1]
  def change
    create_table :chapters do |t|
      t.string :name, null: false, default: ''
      t.string :description
      t.string :notes

      t.integer :position

      t.belongs_to :campaign

      t.timestamps
    end
  end
end
