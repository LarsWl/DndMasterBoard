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
    @chapter = Chapter.new(campaign_id: params[:campaign_id])
  end

  def create
    @chapter = Chapter.new(chapter_params)

    puts @chapter.errors.full_messages unless @chapter.save

    render partial: 'campaigns/partials/plot', locals: { campaign: @chapter.campaign }
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
