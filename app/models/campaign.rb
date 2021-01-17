# frozen_string_literal: true

class Campaign < ApplicationRecord
  has_many :chapters
  has_many :master_characters
end
