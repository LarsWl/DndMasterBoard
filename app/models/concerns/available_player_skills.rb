module AvailablePlayerSkills
  extend ActiveSupport::Concern

  ADDITIONAL_SKILLS = [
    { name: 'Акробатика', code: 'ACR', characteristic: 'DEX' },
    { name: 'Скрытность', code: 'STE', characteristic: 'DEX' },
    { name: 'Ловкость рук', code: 'SLE', characteristic: 'DEX' },
    { name: 'Атлетика', code: 'ATH', characteristic: 'STR' },
    { name: 'Понимание животных', code: 'ANI', characteristic: 'WIS' },
    { name: 'Проницательность', code: 'INS', characteristic: 'WIS' },
    { name: 'Медицина', code: 'MED', characteristic: 'WIS' },
    { name: 'Восприятие',code: 'PERC', characteristic: 'WIS' },
    { name: 'Выживание', code: 'SUR', characteristic: 'WIS' },
    { name: 'Тайны', code: 'ARC', characteristic: 'INT' },
    { name: 'История', code: 'HIS', characteristic: 'INT' },
    { name: 'Исследование', code: 'INV', characteristic: 'INT' },
    { name: 'Природа', code: 'NAT', characteristic: 'INT' },
    { name: 'Религия', code: 'REL', characteristic: 'INT' },
    { name: 'Обман', code: 'DEC', characteristic: 'CHA' },
    { name: 'Запугивание', code: 'INT', characteristic: 'CHA' },
    { name: 'Выступление', code: 'PERF', characteristic: 'CHA' },
    { name: 'Убеждение', code: 'PERS', characteristic: 'CHA' }
  ]

  SAVING_THROWS = [
    { name: 'Сила', characteristic: 'STR' },
    { name: 'Ловкость', characteristic: 'DEX' },
    { name: 'Инетеллект', characteristic: 'INT' },
    { name: 'Мудрость', characteristic: 'WIS' },
    { name: 'Харизма', characteristic: 'CHA' },
    { name: 'Вынослив.', characteristic: 'CON' }
  ]
end