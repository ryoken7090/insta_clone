class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user, only: [:show, :index]

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def confirm
    @story = Story.new(story_params)
    @story.user_id = current_user.id
    render :new if @story.invalid?
  end

  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @story.save
        NoticeMailer.notice_mail(@story).deliver
        flash[:success] = '投稿できました'
        redirect_to stories_path
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(story_id: @story.id)
  end

  def edit
    unless @story.user_id == current_user.id
      flash[:warning] = '他のユーザーは編集できません'
      redirect_to stories_path
    end
  end

  def update
    if @story.update(story_params)
      flash[:success] = '編集できました'
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
    params.require(:story).permit(:content, :image, :image_cache)
  end

  def set_story
    @story = Story.find(params[:id])
  end
  
end
