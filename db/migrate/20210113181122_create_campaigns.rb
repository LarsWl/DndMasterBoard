# frozen_string_literal: true

class CreateCampaigns < ActiveRecord::Migration[6.1]
  def change
    create_table :campaigns do |t|
      t.string :name, null: false, default: ''
      t.string :description
      t.string :history
      t.string :notes

      t.timestamps
    end
  end
end
