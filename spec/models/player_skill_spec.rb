require 'rails_helper'

RSpec.describe PlayerSkill, type: :model do
  describe 'setting modifier' do
    it 'set correct modifier without proficiency' do
      player_skill = FactoryBot.create(:player_skill, proficiency: false )

      expect(player_skill.modifier).to eq player_skill.main_characteristic.modifier
    end

    it 'set correct modifier with proficiency' do
      player_skill = FactoryBot.create(:player_skill, proficiency: true)

      expect(player_skill.modifier).to eq player_skill.main_characteristic.modifier + 2
    end
  end
end
