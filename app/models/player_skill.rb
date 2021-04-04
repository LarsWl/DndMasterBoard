class PlayerSkill < Skill
  belongs_to :main_characteristic

  before_save :update_modifier

  enum skill_type: {
    saving_throw: 0,
    additional_skill: 1
  }

  private

  def update_modifier
    self.modifier = main_characteristic.modifier
    self.modifier += 2 if proficiency
  end
end
