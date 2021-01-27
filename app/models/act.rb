# frozen_string_literal: true

class Act < ApplicationRecord
  belongs_to :chapter
  has_many :act_characters
  has_many :master_characters, through: :act_characters, source: :character, class_name: 'MasterCharacter'
  has_many :enemies, through: :act_characters, source: :character, class_name: 'Enemy'

  delegate :campaign, to: :chapter

  acts_as_list scope: :chapter
end
