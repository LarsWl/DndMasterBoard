class CombatSkillDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def fields
    fields = {}

    fields[:character_id] = {
      input: :hidden_field,
    }

    fields[:name] = {
      input: :text_field,
      label: 'Название'
    }

    fields[:damage] = {
      input: :text_field,
      label: 'Наносимый урон'
    }

    fields[:hit_modifier] = {
      input: :text_field,
      label: 'Модификатор поподания'
    }

    fields[:description] = {
      input: :text_area,
      ckeditor_id: 'description_edit',
      label: 'Описание'
    }

    fields
  end
end
