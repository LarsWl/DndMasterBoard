class CampaignInvitation < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :campaign

  enum status: {
    initialized: 0,
    sent: 10,
    accepted: 20,
    declined: 30
  }

  def send!
    sent!
  end

  def accept!
    accepted!

    CampaignMemberRepository.new.create(
      user: receiver,
      campaign: campaign
    )
  end

  def decline!
    declined!
  end
end
