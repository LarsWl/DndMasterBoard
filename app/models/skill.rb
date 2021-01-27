class Skill < ApplicationRecord
  belongs_to :character

  self.abstract_class = true
end
