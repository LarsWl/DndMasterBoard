# frozen_string_literal: true

class Act < ApplicationRecord
  belongs_to :chapter
  has_many :not_playable_characters

  acts_as_list scope: :chapter
end
