module DefaultCharacteristics
  extend ActiveSupport::Concern

  DEFAULT_MAIN_CHARACTERISTICS = {
    'Сила' => { value: '10', code: 'STR' },
    'Ловкость' => { value: '10', code: 'DEX' },
    'Интеллект' => { value: '10', code: 'INT' },
    'Мудрость' => { value: '10', code: 'WIS' },
    'Харизма' => { value: '10', code: 'CHA' },
    'Выносливость' => { value: '10', code: 'CON' }
  }.freeze
end