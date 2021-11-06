# frozen_string_literal: true

require_relative '../../rails_helper'

RSpec.describe Editor::PlayerCharactersController do
  context 'user logged in' do
    let(:character) { FactoryBot.create(:player_character) }

    before :all do
      @user = FactoryBot.create(:user)
      @player_characters = FactoryBot.create_list(:player_character, 10)
    end

    before :each do
      sign_in @user
    end

    describe '#index' do
      it 'return success' do
        get :index

        expect(response).to have_http_status(:success)
      end
    end

    describe '#show' do
      it 'return success' do
        get :show, params: { id: @player_characters.first.id }

        expect(response).to have_http_status(:success)
      end
    end
  end
end
