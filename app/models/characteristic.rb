class Characteristic < ApplicationRecord
  belongs_to :characterized, polymorphic: true

  before_save :set_modifier

  self.abstract_class = true
end
