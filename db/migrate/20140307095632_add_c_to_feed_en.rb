class AddCToFeedEn < ActiveRecord::Migration
  def change
    add_column :feed_entries, :feed_title, :string
    add_column :feed_entries, :feed_url, :string
  end
end
