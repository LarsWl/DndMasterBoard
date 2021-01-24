class CreateCampaignMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :campaign_members do |t|
      t.integer :role, null: false, default: 0

      t.belongs_to :campaign
      t.belongs_to :user
      t.belongs_to :character

      t.timestamps
    end
  end
end
