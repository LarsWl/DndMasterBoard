class GameController < ApplicationController
  layout 'game'
  before_action :authenticate_user!
end
