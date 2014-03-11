require 'feedzirra'
class Feed < ActiveRecord::Base
has_many :feed_etries

  def self.update_feed(feed_url)
    feed=Feedzirra::Feed.fetch_and_parse(feed_url)
    create!(
        :title=>feed.title,
        :url=>feed.url
    )

  end
end