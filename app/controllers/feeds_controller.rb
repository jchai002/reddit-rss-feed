class FeedsController < ApplicationController

  def index
    @feeds = Feed.all
  end

  def new
    @feed = Feed.new
  end

  def create
    @feed = Feed.create(feed_params)
    redirect_to feeds_path
  end

  def edit
    @feed = Feed.find(params[:id])
  end

  def update
    @feed = Feed.find(params[:id])
    @feed.update(feed_params)
    redirect_to feeds_path
  end

  def show
    @feed = Feed.find(params[:id])
    @articles = @feed.get_articles
  end

  def destroy
    @feed=Feed.find_by({id: params[:id]})
    if @feed.destroy
      render :json => {message:"Feed deleted!"}
    else
      render :json => {message: "Something went wrong, blame it on the cats!"}
    end
  end

  private
    def feed_params
      params[:feed].permit(:query)
    end
end
