# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe EnemiesController do
  context 'user logged in' do
    let(:campaign) { FactoryBot.create(:campaign) }
    let(:act) { FactoryBot.create(:act) }

    before :all do
      @user = FactoryBot.create(:user)
      @enemies = FactoryBot.create_list(:enemy, 10)
    end

    before :each do
      sign_in @user
    end

    describe '#show' do
      it 'success' do
        get :show, params: { id: @enemies.first.id }

        expect(response).to have_http_status(:success)
      end
    end

    describe '#new' do
      it 'success' do
        get :new, params: { enemy: { campaign_id: campaign.id, act_id: act.id } }

        expect(response).to have_http_status(:success)
      end
    end

    describe '#edit' do
      it 'success' do
        get :edit, params: { id: @enemies.first.id }

        expect(response).to have_http_status(:success)
      end
    end

    describe '#update' do
      it 'success' do
        patch :update, params: { id: @enemies.first.id, enemy: { notes: '1', description: '2' } }

        expect(response).to have_http_status(:success)
      end
    end

    describe '#create' do
      it 'success' do
        post :create, params: {
          id: @enemies.first.id,
          format: 'text/vnd.turbo-stream.html',
          enemy: { notes: '1', description: '2', campaign_id: campaign.id, act_id: act.id}
        }

        expect(response).to have_http_status(:success)
      end

      it 'add enemy to campaign' do
        enemies_in_campaign = Campaign.find(campaign.id).enemies.count

        post :create, params: {
          id: @enemies.first.id,
          format: 'text/vnd.turbo-stream.html',
          enemy: { notes: '1', description: '2', campaign_id: campaign.id, act_id: act.id}
        }

        enemies_in_campaign_after_create = Campaign.find(campaign.id).enemies.count

        expect(enemies_in_campaign_after_create).to eq(enemies_in_campaign + 1)
      end

      it 'add character to act' do
        enemies_in_act = Act.find(act.id).enemies.count

        post :create, params: {
          id: @enemies.first.id,
          format: 'text/vnd.turbo-stream.html',
          enemy: { notes: '1', description: '2', campaign_id: campaign.id, act_id: act.id}
        }

        enemies_in_act_after_create = Act.find(act.id).enemies.count

        expect(enemies_in_act_after_create).to eq(enemies_in_act + 1)
      end
    end
  end
end
