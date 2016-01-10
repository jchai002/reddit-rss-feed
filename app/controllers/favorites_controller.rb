class FavoritesController < ApplicationController

  def create
    @fav=Favorite.new(favorite_params)
    if @fav.save
      render :json => {message:"Yo dawg, this puppy is saved!"}
    else
      render :json => {error:"Sorry, you can't favorite this again, blame it on the cats!"}
    end
  end

  def index
    @favs=Favorite.all
  end

  def destroy
    @fav=Favorite.find_by({id: params[:id]})
    if @fav.destroy
      render :json => {message:"Article deleted!"}
    else
      render :json => {error:"Article deletion error!"}
    end
  end


  private
    def favorite_params
      params[:favorite].permit(:title,:date,:link)
    end
end
