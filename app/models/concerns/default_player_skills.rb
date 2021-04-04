module DefaultPlayerSkills
  extend ActiveSupport::Concern

  ADDITIONAL_SKILLS = [
    { name: 'Акробатика', characteristic: 'DEX' },
    { name: 'Скрытность', characteristic: 'DEX' },
    { name: 'Ловкость рук', characteristic: 'DEX' },
    { name: 'Атлетика', characteristic: 'STR' },
    { name: 'Понимание животных', characteristic: 'WIS' },
    { name: 'Проницательность', characteristic: 'WIS' },
    { name: 'Медицина', characteristic: 'WIS' },
    { name: 'Восприятие', characteristic: 'WIS' },
    { name: 'Выживание', characteristic: 'WIS' },
    { name: 'Тайны', characteristic: 'INT' },
    { name: 'История', characteristic: 'INT' },
    { name: 'Исследование', characteristic: 'INT' },
    { name: 'Природа', characteristic: 'INT' },
    { name: 'Религия', characteristic: 'INT' },
    { name: 'Обман', characteristic: 'CHA' },
    { name: 'Запугивание', characteristic: 'CHA' },
    { name: 'Выступление', characteristic: 'CHA' },
    { name: 'Убеждегие', characteristic: 'CHA' }
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