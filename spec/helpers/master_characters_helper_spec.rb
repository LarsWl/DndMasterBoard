require 'rails_helper'

RSpec.describe MasterCharactersHelper, type: :helper do
  describe '#new_master_character_fields' do
    it 'return hash' do
      expect(new_master_character_fields.instance_of?(Hash)).to be true
    end

    it 'contain only attributes of chapter' do
      master_character = FactoryBot.create(:master_character)

      master_character_respond_to_all_fields = new_master_character_fields.keys.none? do |field_name|
        !master_character.respond_to?(field_name)
      end

      expect(master_character_respond_to_all_fields).to be true
    end
  end
end
