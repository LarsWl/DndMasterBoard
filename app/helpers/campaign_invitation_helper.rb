module CampaignInvitationHelper
  def campaign_invitation_create_button_title(invitation)
    return 'Уже отправлено' if invitation.present?

    'Отправить приглашение'
  end
end
