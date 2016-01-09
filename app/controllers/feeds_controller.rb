class FeedsController < ApplicationController
  require 'open-uri'
  require 'nokogiri'

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
    feed_url = "https://www.reddit.com/r/#{@feed.query}/.rss"

    begin
      doc = Nokogiri::XML(open(feed_url))
    rescue
    end

    @articles = []
    doc.css('item').each_with_index do |node, idx|
       item = {
         id: idx,
         title: node.css('title').children.text,
         link:node.css('link').children.text,
         date:node.css('pubDate').children.text
       }
       @articles.push(item)
    end
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
