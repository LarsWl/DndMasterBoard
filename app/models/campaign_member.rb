class CampaignMember < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  belongs_to :character, optional: true

  enum role: {
    player: 0,
    master: 10,
    npc: 20
  }
end
