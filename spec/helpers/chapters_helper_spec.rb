# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChaptersHelper, type: :helper do
  describe '#new_chapter_fields' do
    it 'return hash' do
      expect(new_chapter_fields.instance_of?(Hash)).to be true
    end

    it 'contain only attributes of chapter' do
      chapter = FactoryBot.create(:chapter)

      chapter_respond_to_all_fields = new_chapter_fields.keys.none? { |field_name| !chapter.respond_to?(field_name)}

      expect(chapter_respond_to_all_fields).to be true
    end
  end
end
