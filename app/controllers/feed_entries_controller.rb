class FeedEntriesController < ApplicationController

  def index
    @feed=Feed.all
  end

  def create

    if @feed=Feed.update_feed(params[:feed][:url])
      @feed_entry = FeedEntry.update_from_feed(params[:feed][:url], @feed.id)
      redirect_to action: :index
    else
      redirect_to :back
      flash[:notice] = "Invalid url"
    end

  end
end