class FeedEntry < ActiveRecord::Base
belongs_to :feed
  def self.update_from_feed(feed_url,feed_id)
    feed=Feedzirra::Feed.fetch_and_parse(feed_url)

    feed.entries.each do |entry|
      unless exists? :guid => entry.id
        create!(
            :name=>entry.title,
            :summary=>entry.summary,
            :url=>entry.url,
            :published_at=>entry.published,
            :guid=>entry.id,
            :feed_id=>feed_id
        )
      end
    end
  end
end
