# frozen_string_literal: true

FactoryBot.define do
  factory :campaign do
    name { 'campaign name' }
    description { 'campaign_description' }
    history { 'campaign_history' }
    notes { 'campaign_notes' }
  end

  factory :chapter do
    name { 'chapter name' }
    description { 'chapter_description' }
    notes { 'chapter_notes' }

    campaign
  end

  factory :act do
    name { 'act name' }
    description { 'act_description' }
    notes { 'act_notes' }

    chapter
  end

  factory :act_character do
    act
    character
  end

  def act_with_characters(master_characters_count: 2, enemies_count: 2)
    FactoryBot.create(act) do
      FactoryBot.create_list(:master_character, master_characters_count, acts: [act])
      FactoryBot.create_list(:enemy, enemies_count, acts: [act])
    end
  end
end
