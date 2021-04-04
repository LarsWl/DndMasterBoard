class User < ApplicationRecord
  include PgSearch::Model

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :campaign_members
  has_many :campaigns, through: :campaign_members
  has_many :player_characters
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_one_attached :avatar

  validates :nickname, uniqueness: { case_sensitive: false }

  pg_search_scope :search_by_nickname, against: :nickname

  def approved_friends
    friendships.approved.map(&:friend)
  end

  def friendship_requests
    Friendship.includes(:user, :friend).where(friend_id: id).not_approved
  end

  def search_possible_friends(search_nickname)
    User.includes(:friends, :friendships)
        .search_by_nickname(search_nickname)
        .where.not(id: approved_friends.map(&:id) << id)
  end
end
