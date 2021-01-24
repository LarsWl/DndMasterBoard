class Character < ApplicationRecord
  include DefaultCharacteristics

  belongs_to :act, optional: true
  belongs_to :campaign, optional: true
  belongs_to :user, optional: true

  has_one_attached :portrait

  has_many :skills
  has_many :main_characteristics, as: :characterized

  after_create :set_main_characteristics

  private

  def set_main_characteristics
    DEFAULT_MAIN_CHARACTERISTICS.each_pair do |c_name, c_value|
      MainCharacteristic.create(name: c_name, value: c_value, characterized: self)
    end
  end
end
