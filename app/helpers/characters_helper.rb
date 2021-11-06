module CharactersHelper
  def editor_character_path(character)
    case
    when character.instance_of?(MasterCharacter)
      editor_master_character_path(character)
    when character.instance_of?(Enemy)
      editor_enemy_path(character)
    when character.instance_of?(PlayerCharacter)
      editor_player_character_path(character)
    end
  end
end
