class MainCharacteristic < Characteristic
  before_save :set_modifier

  after_commit :update_player_skills, on: %i[update], if: :player_character_characteristic?

  acts_as_list scope: :characterized

  default_scope { order(:position) }

  enum code: {
    'STR' => 0,
    'INT' => 1,
    'DEX' => 2,
    'WIS' => 3,
    'CHA' => 4,
    'CON' => 5
  }

  def compute_modifier
    (value - 10) / 2
  end

  def player_character_characteristic?
    characterized.instance_of? PlayerCharacter
  end

  private

  def update_player_skills
    PlayerSkill.where(main_characteristic_id: id).each(&:save)
  end

  def set_modifier
    self.modifier = compute_modifier
  end
end
