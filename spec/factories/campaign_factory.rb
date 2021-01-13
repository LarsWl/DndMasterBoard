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

  factory :not_playable_character do
    name { 'npc_name' }
    description { 'npc_description' }
    history { 'npc_history' }
    notes { 'npc_notes' }

    campaign
    act
  end
end
