module Editor
  class MainCharacteristicsController < GameController
    before_action :set_main_characteristic, only: %i[update]

    def update
      @main_characteristic.update(main_characteristic_params)
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
end
