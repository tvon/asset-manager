class RemoveUserId < ActiveRecord::Migration
  def self.up
    remove_column :assets, :user_id
  end

  def self.down
    add_column :assets, :user_id, :integer
  end
end