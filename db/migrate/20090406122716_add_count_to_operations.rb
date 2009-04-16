class AddCountToOperations < ActiveRecord::Migration
  def self.up
    add_column :operations ,:count, :integer
  end

  def self.down
    remove_column :count
  end
end
