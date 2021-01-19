# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe 'C and D in CRUD' do
    it 'create new record' do
      campaign_attributes = FactoryBot.attributes_for(:campaign)

      count_before_create = Campaign.count
      Campaign.create(campaign_attributes)
      count_after_create = Campaign.count

      expect(count_after_create).to eq(count_before_create + 1)
    end

    it 'destroy record' do
      count_before_create = Campaign.count
      Campaign.last.destroy
      count_after_create = Campaign.count

      expect(count_after_create).to eq(count_before_create - 1)
    end
  end
end
