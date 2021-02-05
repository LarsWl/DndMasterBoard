class Skill < ApplicationRecord
  belongs_to :character, polymorphic: true

  self.abstract_class = true
end
