require 'rails_helper'

RSpec.describe MainCharacteristic, type: :model do
  describe '#compute_modifier' do
    it 'compute right value' do
      main_characteristic = FactoryBot.build(:main_characteristic)

      expect(main_characteristic.compute_modifier).to eq((main_characteristic.value - 10) / 2)
    end
  end

  context 'CRUD' do
    describe '#create' do
      it 'create new record' do
        main_characteristic_attributes = FactoryBot.attributes_for(:main_characteristic)

        main_characteristic = MainCharacteristic.new(main_characteristic_attributes)
        main_characteristic.characterized = FactoryBot.create(:master_character)
        count_before_create = MainCharacteristic.count
        main_characteristic.save
        count_after_create = MainCharacteristic.count

        expect(count_after_create).to eq(count_before_create + 1)
      end

      it 'set modifier' do
        main_characteristic = FactoryBot.create(:main_characteristic)

        expect(main_characteristic.modifier.to_i).to eq(main_characteristic.compute_modifier)
      end
    end
  end
end
