module Editor
  class MasterCharactersController < EditorController
    before_action :set_master_character, only: %i[show edit update]

    def index
      @master_characters = MasterCharacterRepository.new.user_master_characters(current_user)
    end

    def new
      @master_character = MasterCharacter.new
    end

    def update
      @master_character.update(master_character_params)

      render 'show'
    end

    def create
      @master_character = MasterCharacterRepository.new.create(master_character_params)
    end

    private

    def set_master_character
      @master_character = MasterCharacterRepository.new.find(params[:id])
    end

    def master_character_params
      params.require(:master_character).permit(
        :description,
        :notes,
        :name,
        :portrait,
        :campaign_id,
        :act_id
      )
    end
  end
end
