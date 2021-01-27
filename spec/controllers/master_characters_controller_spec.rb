# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe MasterCharactersController do
  context 'user logged in' do
    let(:campaign) { FactoryBot.create(:campaign) }
    let(:act) { FactoryBot.create(:act) }

    before :all do
      @user = FactoryBot.create(:user)
      @master_characters = FactoryBot.create_list(:master_character, 10)
    end

    before :each do
      sign_in @user
    end

    describe '#show' do
      it 'success' do
        get :show, params: { id: @master_characters.first.id }

        expect(response).to have_http_status(:success)
      end
    end

    describe '#new' do
      it 'success' do
        get :new, params: { master_character: { campaign_id: campaign.id, act_id: act.id } }

        expect(response).to have_http_status(:success)
      end
    end

    describe '#edit' do
      it 'success' do
        get :edit, params: { id: @master_characters.first.id }

        expect(response).to have_http_status(:success)
      end
    end

    describe '#update' do
      it 'success' do
        patch :update, params: { id: @master_characters.first.id, master_character: { notes: '1', description: '2' } }

        expect(response).to have_http_status(:success)
      end
    end

    describe '#create' do
      it 'success' do
        post :create, params: {
                        id: @master_characters.first.id,
                        format: 'text/vnd.turbo-stream.html',
                        master_character: { notes: '1', description: '2', campaign_id: campaign.id, act_id: act.id}
                      }

        expect(response).to have_http_status(:success)
      end

      it 'add character to campaign' do
        characters_in_campaign = Campaign.find(campaign.id).master_characters.count

        post :create, params: {
                        id: @master_characters.first.id,
                        format: 'text/vnd.turbo-stream.html',
                        master_character: { notes: '1', description: '2', campaign_id: campaign.id, act_id: act.id}
                      }

        characters_in_campaign_after_create = Campaign.find(campaign.id).master_characters.count

        expect(characters_in_campaign_after_create).to eq(characters_in_campaign + 1)
      end

      it 'add character to act' do
        characters_in_act = Act.find(act.id).master_characters.count

        post :create, params: {
          id: @master_characters.first.id,
          format: 'text/vnd.turbo-stream.html',
          master_character: { notes: '1', description: '2', campaign_id: campaign.id, act_id: act.id}
        }

        characters_in_act_after_create = Act.find(act.id).master_characters.count

        expect(characters_in_act_after_create).to eq(characters_in_act + 1)
      end
    end
  end
end
