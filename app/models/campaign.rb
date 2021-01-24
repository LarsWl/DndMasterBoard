# frozen_string_literal: true

class Campaign < ApplicationRecord
  has_many :chapters
  has_many :master_characters
  has_many :campaign_members
  has_many :users, through: :campaign_members
end
