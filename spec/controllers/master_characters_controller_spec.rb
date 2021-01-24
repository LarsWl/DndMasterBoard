# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe MasterCharactersController do
  context 'user logged in' do
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
  end
end
