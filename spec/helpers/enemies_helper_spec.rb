require 'rails_helper'

RSpec.describe EnemiesHelper, type: :helper do
  describe '#new_enemy_fields' do
    it 'return hash' do
      expect(new_enemy_fields.instance_of?(Hash)).to be true
    end

    it 'contain only attributes of chapter' do
      enemy = FactoryBot.create(:enemy)

      enemy_respond_to_all_fields = new_enemy_fields.keys.none? do |field_name|
        !enemy.respond_to?(field_name)
      end

      expect(enemy_respond_to_all_fields).to be true
    end
  end
end
