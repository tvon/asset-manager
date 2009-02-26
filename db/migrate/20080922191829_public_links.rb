class PublicLinks < ActiveRecord::Migration
  def self.up
    add_column :assets, :public, :boolean, :default => 0
    add_column :assets, :pubslug, :string
    add_index :assets, :pubslug
  end

  def self.down
    remove_column :assets, :public
    remove_column :assets, :pubslug
    remove_index :assets, :pubslug
  end
end
