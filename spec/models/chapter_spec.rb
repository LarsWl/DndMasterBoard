# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Chapter, type: :model do
  describe 'C and D in CRUD' do
    it 'create new record' do
      chapter_attributes = FactoryBot.attributes_for(:chapter)

      chapter = Chapter.new(chapter_attributes)
      chapter.campaign = FactoryBot.create(:campaign)
      count_before_create = Chapter.count
      chapter.save
      count_after_create = Chapter.count

      expect(count_after_create).to eq(count_before_create + 1)
    end

    it 'destroy record' do
      count_before_create = Chapter.count
      Chapter.last.destroy
      count_after_create = Chapter.count

      expect(count_after_create).to eq(count_before_create - 1)
    end
  end
end
