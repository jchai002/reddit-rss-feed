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
    @favs=Favorite.order(:created_at)
  end

  def destroy
    @fav=Favorite.find_by({id: params[:id]})
    if @fav.destroy
      render :json => {message:"Yo Dawg, this article is deleted!"}
    else
      render :json => {error:"Something went wrong, blame it on the cats!"}
    end
  end


  private
    def favorite_params
      params[:favorite].permit(:title,:date,:link)
    end
end
