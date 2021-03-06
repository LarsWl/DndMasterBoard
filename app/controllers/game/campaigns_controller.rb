# frozen_string_literal: true

module Game
  class CampaignsController < GameController
    before_action :set_campaign, only: %i[show update edit]

    def index
      @campaigns = current_user.campaigns.includes(:master_characters, :chapters).all
    end

    def show; end

    def edit; end

    def update
      @campaign.update(campaign_params)

      render 'show'
    end

    private

    def campaign_params
      params.require(:campaign).permit(:description, :history, :notes)
    end

    def set_campaign
      @campaign = Campaign.find(params[:id])
    end
  end
end
