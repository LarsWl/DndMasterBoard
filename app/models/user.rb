class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :campaign_members
  has_many :campaigns, through: :campaign_members
end
