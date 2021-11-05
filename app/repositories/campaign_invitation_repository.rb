class CampaignInvitationRepository < BaseRepository

  def initialize
    @model_class = CampaignInvitation
  end

  def incoming_for_user(receiver)
    includes(:receiver, :sender, :campaign).where(status: :sent, receiver_id: receiver.id)
  end

  def incoming_for_user_by_campaign(receiver, campaign)
    includes(:receiver, :sender, :campaign).find_by(status: :sent, receiver_id: receiver.id, campaign_id: campaign.id)
  end
end
