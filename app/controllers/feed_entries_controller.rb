class FeedEntriesController < ApplicationController

  def index
    feed_entries=FeedEntry.all
    @news=Hash.new
    feed_entries.entries.each do |feed|
      if @news[feed.feed_url]
        @news[feed.feed_url].push(feed)

        #@t.each do |val|
          #@ar=val.title
        #end
      else
        @news[feed.feed_url]=Array.new
      end
    end

  end

  def new

  end

  def create

    if @feed=Feed.update_feed(params[:feed][:url])
      @feed_entry = FeedEntry.update_from_feed(params[:feed][:url])
      redirect_to action: :index
    else
      redirect_to :back
      flash[:notice] = "Invalid url"
    end

  end
end