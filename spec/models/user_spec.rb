require 'rails_helper'

RSpec.describe User, type: :model do
  describe "search_possible_friends" do
    before :all do
      @joseph_users = FactoryBot.create_list(:user_joseph, 10)
      @jotaro_users = FactoryBot.create_list(:user_jotaro, 10)

      @user = user_with_friends
    end

    it 'search user_josephs by nickname part' do
      possible_friends = @user.search_possible_friends('joseph')

      expected_user_ids = @joseph_users.map(&:id).sort

      expect(possible_friends.map(&:id).sort).to eq expected_user_ids
    end

    it 'search one by full nickname' do
      jotaro_user = @jotaro_users.first

      search_result = @user.search_possible_friends(jotaro_user.nickname)

      expect(search_result.count).to eq 1
      expect(search_result.first.id).to eq jotaro_user.id
    end

    it 'doesnt search yourself' do
      possible_friends = @user.search_possible_friends(@user.nickname)

      expect(possible_friends.map(&:id).include? @user.id).to eq false
    end

    it 'doesnt search approved friends' do
      friend = @user.friendships.approved.first.friend

      possible_friends = @user.search_possible_friends(friend.nickname)

      expect(possible_friends.map(&:id).include? friend.id).to eq false
    end
  end
end
