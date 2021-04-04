class PlayerCharactersController < GameController
  before_action :set_player_character, only: %i[show]

  def index
    @player_characters = current_user.player_characters
  end

  def show; end

  def new
    @player_character = PlayerCharacter.new
  end

  def create
    @player_character = PlayerCharacter.new(player_character_params)
    @player_character.user = current_user
    @player_character.save
  end

  private

  def player_character_params
    params.require(:player_character).permit(
      :name,
      :race_id,
      :character_class_id
    )
  end

  def set_player_character
    @player_character = PlayerCharacter.find(params[:id])
  end
end
