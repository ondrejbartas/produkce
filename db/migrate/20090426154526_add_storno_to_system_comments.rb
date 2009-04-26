class AddStornoToSystemComments < ActiveRecord::Migration
  def self.up
    add_column :system_comments, :storno, :boolean
  end

  def self.down
    remove_column :system_comments, :storno
  end
end
