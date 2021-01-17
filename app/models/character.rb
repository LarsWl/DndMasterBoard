class Character < ApplicationRecord
  belongs_to :act, optional: true
  belongs_to :campaign, optional: true

  has_one :portrait, as: 'assetable', :class_name => 'Portrait'
  accepts_nested_attributes_for :portrait

  has_many :skills
  has_many :characteristics, as: :characterized
end
