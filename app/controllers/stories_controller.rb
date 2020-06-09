class StoriesController < ApplicationController
  def index
  end

  def new
    @story = Story.new
  end

  def create
    Story.create(story_params)
    redirect_to stories_path
  end

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  private
  def story_params
    params.require(:story).permit(:content, :image)
  end
end
