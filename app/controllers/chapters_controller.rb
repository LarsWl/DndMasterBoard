# frozen_string_literal: true

class ChaptersController < ApplicationController
  before_action :set_chapter, on: %i[show edit update]

  def show; end

  def edit; end

  def update
    @chapter.update(chapter_params)

    render 'show'
  end

  private

  def chapter_params
    params.require(:chapter).permit(
      :description,
      :notes
    )
  end

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end
end
