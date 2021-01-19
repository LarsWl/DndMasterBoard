# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe ActsController do
  before :all do
    @act = FactoryBot.create_list(:act, 10)
  end

  describe '#show' do
    it 'success' do
      get :show, params: { id: @act.first.id }

      expect(response).to have_http_status(:success)
    end
  end

  describe '#edit' do
    it 'success' do
      get :edit, params: { id: @act.first.id }

      expect(response).to have_http_status(:success)
    end
  end

  describe '#update' do
    it 'success' do
      patch :update, params: { id: @act.first.id, act: { notes: '1', description: '2', plot: '3'} }

      expect(response).to have_http_status(:success)
    end
  end
end
