class DropTabl < ActiveRecord::Migration
  def change
    drop_table(:feeds)
  end
end
