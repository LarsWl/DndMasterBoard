module Game
  class GameController < ApplicationController
    layout 'game/game'
    before_action :authenticate_user!
  end
end
