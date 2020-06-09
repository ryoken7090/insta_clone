class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)
    if @story.save
      redirect_to stories_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @story.update(story_params)
      redirect_to stories_path
    else
      render :edit
    end
  end

  def destroy
    @story.destroy
    redirect_to stories_path
  end

  private
  def story_params
    params.require(:story).permit(:content, :image)
  end

  def set_story
    @story = Story.find(params[:id])
  end
end
