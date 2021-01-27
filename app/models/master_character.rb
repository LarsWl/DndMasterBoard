class MasterCharacter < Character
  has_many :act_characters
  has_many :acts, through: :act_characters
end