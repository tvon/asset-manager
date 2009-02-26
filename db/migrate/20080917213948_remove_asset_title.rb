class RemoveAssetTitle < ActiveRecord::Migration
  def self.up
    remove_column :assets, :title
  end

  def self.down
    add_column :assets, :title, :string
  end
end
