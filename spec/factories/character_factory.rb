FactoryBot.define do
  factory :master_character do
    name { 'master_character' }
    description { 'description' }
    notes { 'notes' }
    type { 'MasterCharacter' }

    act
    campaign
  end
end
