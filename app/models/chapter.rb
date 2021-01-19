# frozen_string_literal: true

class Chapter < ApplicationRecord
  belongs_to :campaign
  has_many :acts

  broadcasts_to :campaign
end
