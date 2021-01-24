module DefaultCharacteristics
  extend ActiveSupport::Concern

  DEFAULT_MAIN_CHARACTERISTICS = {
    'Сила' => '10',
    'Ловкость' => '10',
    'Интеллект' => '10',
    'Мудрость' => '10',
    'Харизма' => '10',
    'Выносливость' => '10'
  }.freeze
end