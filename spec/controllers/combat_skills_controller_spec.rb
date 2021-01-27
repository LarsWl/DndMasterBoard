# frozen_string_literal: true

require_relative '../rails_helper'

RSpec.describe CombatSkillsController do
  context 'user logged in' do
    let(:character) { FactoryBot.create(:enemy) }

    before :all do
      @user = FactoryBot.create(:user)
      @combat_skills = FactoryBot.create_list(:combat_skill, 10)
    end

    before :each do
      sign_in @user
    end

    describe '#new' do
      it 'success' do
        get :new, params: { combat_skill: { character_id: character.id } }

        expect(response).to have_http_status(:success)
      end
    end

    describe '#edit' do
      it 'success' do
        get :edit, params: { id: @combat_skills.first.id }

        expect(response).to have_http_status(:success)
      end
    end

    describe '#update' do
      it 'success' do
        patch :update, params: { id: @combat_skills.first.id, combat_skill: { description: '2', damage: '3d4+2', hit_modifier: 3 } }

        expect(response).to have_http_status(:success)
      end
    end

    describe '#create' do
      it 'success' do
        post :create, params: {
          id: @combat_skills.first.id,
          format: 'text/vnd.turbo-stream.html',
          combat_skill: { description: '2', character_id: character.id, damage: '3d4+2', hit_modifier: 2 }
        }

        expect(response).to have_http_status(:success)
      end
    end
  end
end
