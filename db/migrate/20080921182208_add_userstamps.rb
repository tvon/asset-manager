class AddUserstamps < ActiveRecord::Migration
  def self.up
    change_table(:assets) do |t|
      t.integer :creator_id, :updater_id, :deleter_id
    end
    change_table(:users) do |t|
      t.integer :creator_id, :updater_id, :deleter_id
    end
  end

  def self.down
    remove_column :assets, :creator_id
    remove_column :assets, :updater_id
    remove_column :assets, :deleter_id
    remove_column :users, :creator_id
    remove_column :users, :updater_id
    remove_column :users, :deleter_id
  end
end
