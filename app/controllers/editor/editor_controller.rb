module Editor
  class EditorController < ApplicationController
    layout 'editor/editor'
    before_action :authenticate_user!

    def index; end
  end
end
