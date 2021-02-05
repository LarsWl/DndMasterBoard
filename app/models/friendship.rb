class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates_presence_of :user_id, :friend_id
  validate :user_is_not_equal_friend
  validates_uniqueness_of :user_id, scope: [:friend_id]

  scope :approved, -> { where(approved: true) }
  scope :not_approved, -> { where(approved: false) }

  after_create_commit do
    broadcast_append_to "user:#{friend.id}:friendship_requests",
                        target: "user:#{friend.id}:friendship_requests",
                        partial: 'friends/friendship_request', locals: { possible_friend: friend }
  end

  def is_mutual
    self.friend.friends.include?(self.user)
  end

  private

  def user_is_not_equal_friend
    errors.add(:friend, "can't be the same as the user") if self.user == self.friend
  end
end
