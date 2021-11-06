module Game
  class CombatSkillsController < GameController
    before_action :set_combat_skill, only: %i[edit update]

    def edit; end

    def update
      @combat_skill.update(combat_skill_params)

      render @combat_skill
    end

    def new
      @combat_skill = CombatSkill.new(combat_skill_params)
    end

    def create
      @combat_skill = CombatSkill.create(combat_skill_params)
    end

    private

    def set_combat_skill
      @combat_skill = CombatSkill.find(params[:id])
    end

    def combat_skill_params
      params.require(:combat_skill).permit(
        :description,
        :damage,
        :character_id,
        :hit_modifier,
        :name
      )
    end
  end
end
