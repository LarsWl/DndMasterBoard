class ActsController < ApplicationController
  before_action :set_act, on: %i[show edit update]

  def show; end

  def edit; end

  def update
    @act.update(act.params)
  end

  private

  def set_act
    @act = Act.find(params[:id])
  end

  def act_params
    params.require(:act).permit(
      :description,
      :notes,
      :plot
    )
  end
end
