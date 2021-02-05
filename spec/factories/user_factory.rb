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

    factory :user_joseph do
      sequence(:nickname) { |n| "joseph_#{n}" }
    end

    factory :user_jotaro do
      sequence(:nickname) { |n| "jotaro_#{n}" }
    end
  end

  factory :friendship do
    user
    association :friend_id, factory: :user
  end
end

def user_with_friend_requests(request_count: 4)
  friends = FactoryBot.create_list(:user, request_count)

  FactoryBot.create(:user) do |user|
    friends.each do |friend|
      FactoryBot.create(:friendship, user: friend, friend: user)
    end
  end
end

def user_with_friends(friends_count: 4)
  FactoryBot.create(:user) do |user|
    1.upto 4 do
      user.friends << FactoryBot.create(:user)
    end

    user.friendships.update(approved: true)
  end
end
