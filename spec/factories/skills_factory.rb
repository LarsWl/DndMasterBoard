FactoryBot.define do
  factory :combat_skill do
    name { 'name' }
    description { 'description' }
    damage { '2d6+1' }
    hit_modifier { 4 }

    character
  end
end