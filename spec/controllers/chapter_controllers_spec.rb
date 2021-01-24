# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe ChaptersController do
  context 'user not logged in' do
    before :all do
      @chapters = FactoryBot.create_list(:chapter, 10)
    end

    describe '#show' do
      it 'success' do
        get :show, params: { id: @chapters.first.id }

        expect(response).to have_http_status(:redirect)
      end
    end

    describe '#edit' do
      it 'success' do
        get :edit, params: { id: @chapters.first.id }

        expect(response).to have_http_status(:redirect)
      end
    end

    describe '#update' do
      it 'success' do
        patch :update, params: { id: @chapters.first.id, chapter: { notes: '1', description: '2' } }

        expect(response).to have_http_status(:redirect)
      end
    end
  end

  context 'user logged in' do
    before :all do
      @user = FactoryBot.create(:user)
      @chapters = FactoryBot.create_list(:chapter, 10)
    end

    before :each do
      sign_in @user
    end

    describe '#show' do
      it 'success' do
        get :show, params: { id: @chapters.first.id }

        expect(response).to have_http_status(:success)
      end
    end

    describe '#edit' do
      it 'success' do
        get :edit, params: { id: @chapters.first.id }

        expect(response).to have_http_status(:success)
      end
    end

    describe '#update' do
      it 'success' do
        patch :update, params: { id: @chapters.first.id, chapter: { notes: '1', description: '2' } }

        expect(response).to have_http_status(:success)
      end
    end
  end
end
