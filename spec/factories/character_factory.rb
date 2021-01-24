FactoryBot.define do
  factory :master_character do
    name { 'master_character' }
    description { 'description' }
    notes { 'notes' }
    type { 'MasterCharacter' }

    act
    campaign
  end

  factory :main_characteristic do
    name { 'name' }
    value { 10 }
    label { 'label' }

    for_master_character

    trait :for_master_character do
      association :characterized, factory: :master_character
    end
  end
end
