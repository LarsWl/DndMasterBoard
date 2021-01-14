require 'rails_helper'

RSpec.describe CampaignsController do
  before :all do
    let(:campaigns) { FactoryBot.create(:campaign) }
  end

  describe "#index" do
    it 'success' do
      get :index

      expect(response).to have_http_status(:success)
    end
  end
end
