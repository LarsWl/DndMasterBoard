# frozen_string_literal: true

module ChaptersHelper
  def new_chapter_fields
    fields = {}

    fields[:campaign_id] = {
      input: :hidden_field,
    }

    fields[:name] = {
      input: :text_field,
      label: 'Название'
    }

    fields[:description] = {
      input: :text_area,
      ckeditor_id: 'description_edit',
      label: 'Описание'
    }

    fields
  end
end
