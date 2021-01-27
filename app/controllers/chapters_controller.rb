# frozen_string_literal: true

class ChaptersController < ApplicationController
  before_action :set_chapter, only: %i[show edit update]

  def show; end

  def edit; end

  def update
    @chapter.update(chapter_params)

    render 'show'
  end

  def new
    @chapter = Chapter.new(chapter_params)
  end

  def create
    @chapter = Chapter.create(chapter_params)

    respond_to do |format|
      format.html { render partial: 'campaigns/plot', locals: { campaign: @chapter.campaign } }
    end
  end

  private

  def chapter_params
    params.require(:chapter).permit(
    :name,
      :description,
      :notes,
      :campaign_id
    )
  end

  def set_chapter
    @chapter = Chapter.find(params[:id])
  end
end
