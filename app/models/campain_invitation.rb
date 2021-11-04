class CampaignInvitation < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :campaign

  enum status: {
    initialized: 0,
    sent: 10,
    accepted: 20,
    decline: 30
  }

  def send

  end
end
