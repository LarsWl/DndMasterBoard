class EnemiesController < GameController
  before_action :set_enemy, only: %i[show edit update]

  def show; end

  def edit; end

  def update
    @enemy.update(enemy_params)

    render 'show'
  end

  def new
    @enemy = Enemy.new(enemy_params)
  end

  def create
    @enemy = Enemy.create(enemy_params)

    if enemy_params[:act_id].present?
      act = Act.find(enemy_params[:act_id])
      act.enemies << @enemy
    end
  end

  private

  def set_enemy
    @enemy = Enemy.find(params[:id])
  end

  def enemy_params
    params.require(:enemy).permit(
      :description,
      :notes,
      :name,
      :portrait,
      :campaign_id,
      :act_id
    )
  end
end
