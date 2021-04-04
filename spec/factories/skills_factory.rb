FactoryBot.define do
  factory :combat_skill do
    name { 'name' }
    description { 'description' }
    damage { '2d6+1' }
    hit_modifier { 4 }

    for_master_character

    trait :for_master_character do
      association :character, factory: :master_character
    end

    trait :for_enemy do
      association :character, factory: :enemy
    end
  end
end