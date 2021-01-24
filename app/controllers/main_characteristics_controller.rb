class MainCharacteristicsController < ApplicationController
  before_action :set_main_characteristic, only: %i[show edit update]

  def show; end

  def edit; end

  def update
    @main_characteristic.update(main_characteristic_params)

    respond_to do |format|
      format.turbo_stream
      format.html { render @main_characteristic }
    end
  end

  private

  def set_main_characteristic
    @main_characteristic = MainCharacteristic.find(params[:id])
  end

  def main_characteristic_params
    params.require(:main_characteristic).permit(
      :name,
      :value
    )
  end
end