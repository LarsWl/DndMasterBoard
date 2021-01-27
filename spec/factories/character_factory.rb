FactoryBot.define do
  factory :character do
    factory :master_character do
      name { 'master_character' }
      description { 'description' }
      notes { 'notes' }
      type { 'MasterCharacter' }

      campaign
    end

    factory :enemy do
      name { 'master_character' }
      description { 'description' }
      notes { 'notes' }
      type { 'Enemy' }

      campaign
    end

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
