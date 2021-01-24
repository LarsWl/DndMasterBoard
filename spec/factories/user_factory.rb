FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :nickname do |n|
    "nickname#{n}"
  end

  factory :user do
    email
    nickname
    password { '123123' }
  end
end
