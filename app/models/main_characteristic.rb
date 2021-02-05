class MainCharacteristic < Characteristic
  before_save :set_modifier

  after_save_commit { broadcast_replace_to 'main_characteristics' }

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

  def set_modifier
    self.modifier = compute_modifier
  end
end
