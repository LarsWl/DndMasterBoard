class MasterCharactersController < ApplicationController
  before_action :set_master_character, only: %i[show edit update]

  def show; end

  def edit; end

  def update
    @master_character.update(master_character_params)

    render @master_character
  end

  def new
    @master_character = MasterCharacter.new(master_character_params)
  end

  def create
    @master_character = MasterCharacter.create(master_character_params)
  end

  private

  def set_master_character
    @master_character = MasterCharacter.find(params[:id])
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
