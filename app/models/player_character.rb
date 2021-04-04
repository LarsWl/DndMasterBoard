class PlayerCharacter < Character

  include DefaultPlayerSkills

  belongs_to :race
  belongs_to :character_class
  belongs_to :user

  has_many :player_skills, as: :character

  after_create_commit :create_player_skills

  def saving_throws
    player_skills.saving_throw
  end

  def additional_skills
    player_skills.additional_skill
  end

  private

  def create_player_skills
    ADDITIONAL_SKILLS.each do |additional_skill|
      PlayerSkill.create(
        name: additional_skill[:name],
        main_characteristic: main_characteristics.find_by(code: additional_skill[:characteristic]),
        skill_type: 'additional_skill',
        character: self
      )
    end

    SAVING_THROWS.each do |saving_throw|
      PlayerSkill.create(
        name: saving_throw[:name],
        main_characteristic: main_characteristics.find_by(code: saving_throw[:characteristic]),
        skill_type: 'saving_throw',
        character: self
      )
    end
  end
end