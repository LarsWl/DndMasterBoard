# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe CampaignsController do
  before :all do
    @campaigns = FactoryBot.create_list(:campaign, 10)
  end

  describe '#index' do
    it 'success' do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe '#show' do
    it 'success' do
      get :show, params: { id: @campaigns.first.id }

      expect(response).to have_http_status(:success)
    end
  end

  describe '#edit' do
    it 'success' do
      get :edit, params: { id: @campaigns.first.id }

      expect(response).to have_http_status(:success)
    end
  end

  describe '#update' do
    it 'success' do
      patch :update, params: { id: @campaigns.first.id, campaign: { notes: '1', description: '2', history: '3'} }

      expect(response).to have_http_status(:success)
    end
  end
end
