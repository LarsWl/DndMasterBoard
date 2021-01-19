# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Chapters', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/partials/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/partials/update'
      expect(response).to have_http_status(:success)
    end
  end
end
