# frozen_string_literal: true

class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end
end
