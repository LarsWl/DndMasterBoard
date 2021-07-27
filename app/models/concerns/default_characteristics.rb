module DefaultCharacteristics
  extend ActiveSupport::Concern

  DEFAULT_MAIN_CHARACTERISTICS = {
    'Сила' => { value: '8', code: 'STR' },
    'Ловкость' => { value: '8', code: 'DEX' },
    'Интеллект' => { value: '8', code: 'INT' },
    'Мудрость' => { value: '8', code: 'WIS' },
    'Харизма' => { value: '8', code: 'CHA' },
    'Вынослив.' => { value: '8', code: 'CON' }
  }.freeze

  PERMIT_MAIN_CHARACTERISTICS = DEFAULT_MAIN_CHARACTERISTICS.to_a.map(&:second).map { |c| c[:code] }
end