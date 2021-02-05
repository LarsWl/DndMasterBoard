require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe '#create' do
    it 'doesnt create friend on itself' do
      user = FactoryBot.create(:user)

      friendship = Friendship.new(user_id: user.id, friend_id: user.id)
      friendship.validate

      expect(friendship.errors[:friend]).to  include("can't be the same as the user")
    end
  end
end
