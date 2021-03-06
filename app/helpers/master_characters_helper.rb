module MasterCharactersHelper
  def new_master_character_fields
    fields = {}

    fields[:campaign_id] = {
      input: :hidden_field,
    }

    fields[:act_id] = {
      input: :hidden_field,
    }

    fields[:name] = {
      input: :text_field,
      label: 'Имя'
    }

    fields[:description] = {
      input: :text_area,
      ckeditor_id: 'description_edit',
      label: 'Описание'
    }

    fields[:notes] = {
      input: :text_area,
      ckeditor_id: 'notes_edit',
      label: 'Заметки'
    }

    fields
  end
end
