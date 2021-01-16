# frozen_string_literal: true

class NotPlayableCharacter < ApplicationRecord
  belongs_to :campaign, optional: true
  belongs_to :act, optional: true
end
