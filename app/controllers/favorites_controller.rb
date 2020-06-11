class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(story_id: params[:story_id])
    redirect_to story_path(params[:story_id])
    # notice登録しましたてきな
  end
  def destroy
    # binding.pry
    favorite = current_user.favorites.find_by(id: params[:id])
    story_id = favorite.story.id
    favorite.destroy
    redirect_to story_path(story_id)
    # notice登録しましたてきな
  end
end
