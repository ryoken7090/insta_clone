class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :favorites_index]
  before_action :authenticate_user, only: [:show, :index]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'ユーザー登録が完了しました'
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @stories = @user.stories.all
  end

  def favorites_index
    @favorites = @user.favorites
    @stories = []
    @favorites.each do |fav|
    @stories << fav.story
    end
  end

  def edit
    unless @user.id == current_user.id
      redirect_to users_path
      flash[:warning] = '他のユーザーは編集できません'
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を編集しました'
      redirect_to user_path(@user.id)
    else
      flash.now[:danger] = 'ユーザー情報を編集できませんでした'
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
end
