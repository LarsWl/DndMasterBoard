module Game
  class CampaignInvitationsController < GameController
    before_action :set_campaign_invitation, on: %i[accept decline]

    def create
      @campaign_invitation = CampaignInvitationRepository.new.create(campaign_invitation_params)

      @campaign_invitation.send!

      render partial: 'campaign_invitation',
             locals: {
               invitation: @campaign_invitation,
               receiver: @campaign_invitation.receiver,
               campaign: @campaign_invitation.campaign
             }
    end

    def accept
      @campaign_invitation.accept!

      render partial: 'game/campaign_invitations/incoming_campaign_invitation', locals: { invitation: @campaign_invitation }
    end

    def decline
      @campaign_invitation.decline!
    end

    private

    def set_campaign_invitation
      @campaign_invitation = CampaignInvitationRepository.new.find(params[:id])
    end

    def campaign_invitation_params
      params.require(:campaign_invitation).permit(
        :sender_id,
        :receiver_id,
        :campaign_id
      )
    end
  end
end

