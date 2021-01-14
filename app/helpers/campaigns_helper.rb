module CampaignsHelper
  DESCRIPTIVE_ATTRIBUTES = %w[description notes history]

  def campaign_attributes(campaign)
    DESCRIPTIVE_ATTRIBUTES.map do |attr|
      if campaign.respond_to?(attr)
        {
          name: attr,
          title: I18n.t("attributes.#{attr}"),
          text: campaign.send(attr),
          type: :text_area
        }
      else
        nil
      end
    end.compact
  end
end
