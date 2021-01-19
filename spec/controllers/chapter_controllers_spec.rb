# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe ChaptersController do
  before :all do
    @chapters = FactoryBot.create_list(:chapter, 10)
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
