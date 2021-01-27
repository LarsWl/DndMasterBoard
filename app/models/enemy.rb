class Enemy < Character
  has_many :act_characters
  has_many :acts, through: :act_characters

  has_many :combat_skills
end
