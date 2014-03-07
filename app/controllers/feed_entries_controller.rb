class FeedEntriesController < ApplicationController
  require 'feedzirra'

  def index
    @feed_entries=FeedEntry.all
    #@feed = Feedzirra::Feed.fetch_and_parse("http://news.yandex.ru/index.rss")
   # @feed = Feedzirra::Feed.fetch_and_parse("http://www.rbc.ua/static/rss/topnews.rus.rss.xml")
    #@feed = Feedzirra::Feed.fetch_and_parse("http://podrobnosti.ua/rss/opinion.rss/")
  # @title = @feed.title
    #@feed_url=@feed.url
  end

  def new

  end

  def create
    if  @feed=Feed.update_feed(params[:feed][:url])
      @feed_entry = FeedEntry.update_from_feed(params[:feed][:url])
      redirect_to action: :index
    else
      redirect_to :back
      flash[:notice] = "Invalid Url"
    end

  end


end