class FeedEntriesController < ApplicationController
  require 'feedzirra'

  def index
    @feed = Feedzirra::Feed.fetch_and_parse("http://news.yandex.ru/index.rss")
    #@feed = Feedzirra::Feed.fetch_and_parse("http://www.rbc.ua/static/rss/topnews.rus.rss.xml")
    #@feed = Feedzirra::Feed.fetch_and_parse("http://podrobnosti.ua/rss/opinion.rss/")
    @title = @feed.title
    @url=@feed.url
  end

end