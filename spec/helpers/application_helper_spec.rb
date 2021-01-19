# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#record_information_attributes' do
    it 'contain fields that are responded by campaign' do
      campaign = FactoryBot.create(:campaign)

      campaign_respond_to_all_fields = record_information_attributes(campaign).none? { |field| !campaign.respond_to?(field[:name])}

      expect(campaign_respond_to_all_fields).to be true
    end

    it 'contain fields that are responded by chapter' do
      chapter = FactoryBot.create(:chapter)

      chapter_respond_to_all_fields = record_information_attributes(chapter).none? { |field| !chapter.respond_to?(field[:name])}

      expect(chapter_respond_to_all_fields).to be true
    end

    it 'contain fields that are responded by act' do
      act = FactoryBot.create(:act)

      act_respond_to_all_fields = record_information_attributes(act).none? { |field| !act.respond_to?(field[:name])}

      expect(act_respond_to_all_fields).to be true
    end
  end
end