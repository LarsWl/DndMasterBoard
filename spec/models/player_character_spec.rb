require 'rails_helper'

RSpec.describe PlayerCharacter, type: :model do
  describe "#create" do
    it 'create player character' do
      character = PlayerCharacter.new(name: 'test_name')
      character.character_class = FactoryBot.create(:character_class)
      character.race = FactoryBot.create(:race)
      character.user = FactoryBot.create(:user)
      player_characters_count = PlayerCharacter.count
      character.save

      expect(PlayerCharacter.count).to eq player_characters_count + 1
    end

    it 'create all additional skills' do
      character = FactoryBot.create(:player_character)

      expect(character.additional_skills.count).to eq PlayerCharacter::ADDITIONAL_SKILLS.count
    end

    it 'create additional skills with correct names' do
      character = FactoryBot.create(:player_character)

      correct_names = PlayerCharacter::ADDITIONAL_SKILLS.map { |as| as[:name] }
      all_name_correct = character.additional_skills.pluck(:name).none? { |name| !correct_names.include? name}

      expect(all_name_correct).to eq true
    end

    it 'create all saving throws' do
      character = FactoryBot.create(:player_character)

      expect(character.saving_throws.count).to eq PlayerCharacter::SAVING_THROWS.count
    end

    it 'create saving throws with correct names' do
      character = FactoryBot.create(:player_character)

      correct_names = PlayerCharacter::SAVING_THROWS.map { |as| as[:name] }
      all_name_correct = character.saving_throws.pluck(:name).none? { |name| !correct_names.include? name}

      expect(all_name_correct).to eq true
    end
  end

  describe '#additional_skills' do
    it 'return player skills with additional_skill type' do
      character = FactoryBot.create(:player_character)

      additional_skills = character.additional_skills

      all_types_correct = additional_skills.none? { |as| as.skill_type != 'additional_skill' }

      expect(all_types_correct).to eq true
    end
  end

  describe '#saving_throws' do
    it 'return player skills with saving_throw type' do
      character = FactoryBot.create(:player_character)

      saving_throws = character.saving_throws

      all_types_correct = saving_throws.none? { |st| st.skill_type != 'saving_throw' }

      expect(all_types_correct).to eq true
    end
  end
end
