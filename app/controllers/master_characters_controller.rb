class MasterCharactersController < ApplicationController
  before_action :set_master_character, only: %i[show edit update]

  def show; end

  def edit; end

  def update
    @master_character.update(master_character_params)
  end

  private

  def set_master_character
    @master_character = MasterCharacter.find(params[:id])
  end

  def master_character_params
    params.require(:master_character).permit(
      :description,
      :notes,
      :name
    )
  end
end
