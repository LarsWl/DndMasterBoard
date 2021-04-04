FactoryBot.define do
  factory :character_class do
    sequence(:name) { |n| "class_#{n}" }
    description { 'description' }
    hit_dice { 'd12' }
  end

  factory :race do
    sequence(:name) { |n| "race_#{n}" }
    description { 'description' }
  end

  factory :player_character do
    sequence(:name) { |n| "character_name_#{n}" }
    history { 'history' }
    description { 'description' }

    race
    character_class
    user
  end

  factory :player_skill do
    default_character

    trait :default_character do
      association :character, factory: :player_character
    end
    main_characteristic

    factory :additional_skill do
      skill_type { 'additional_skill' }
    end

    factory :saving_throw do
      skill_type { 'saving_throw' }
    end
  end
end
