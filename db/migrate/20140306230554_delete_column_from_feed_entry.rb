class DeleteColumnFromFeedEntry < ActiveRecord::Migration
  def change
    remove_column :feed_entries, :feed_title, :string
    remove_column :feed_entries, :feed_url, :string
  end
end
