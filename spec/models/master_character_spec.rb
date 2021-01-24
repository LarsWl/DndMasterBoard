require 'rails_helper'

RSpec.describe MasterCharacter, type: :model do
  context 'CRUD' do
    describe 'create' do
      it 'create new record' do
        master_character_attributes = FactoryBot.attributes_for(:master_character)

        master_character = MasterCharacter.new(master_character_attributes)
        master_character.campaign = FactoryBot.create(:campaign)
        count_before_create = MasterCharacter.count
        master_character.save
        count_after_create = MasterCharacter.count

        expect(count_after_create).to eq(count_before_create + 1)
      end

      describe 'set up main characteristics' do
        let(:master_character) { FactoryBot.create(:master_character) }

        it 'set up right count of main characteristics' do
          current_count = master_character.main_characteristics.count
          right_count = Character::DEFAULT_MAIN_CHARACTERISTICS.keys.count

          expect(current_count).to eq(right_count)
        end

        it 'set up right characteristics' do
          current_characteristics = master_character.main_characteristics.pluck(:name)
          right_characteristics = Character::DEFAULT_MAIN_CHARACTERISTICS.keys

          difference = current_characteristics.difference(right_characteristics)

          expect(difference).to eq []
        end
      end
    end
  end
end
