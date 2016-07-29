class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.all
  end

  def create
    puts params
    favorite_params = params.require(:favorite).permit(:name)
    @favorite = Favorite.create(favorite_params)
    redirect_to favorites_path
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to favorites_path
  end

end
