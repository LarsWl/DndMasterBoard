class Characteristic < ApplicationRecord
  belongs_to :characterized, polymorphic: true
end
