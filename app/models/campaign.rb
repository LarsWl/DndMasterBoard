class Campaign < ApplicationRecord
  has_many :chapters
  has_many :not_playable_characters
end
