class AddArchivToSystemComments < ActiveRecord::Migration
  def self.up
      add_column :system_comments ,:archiv, :boolean
    end

    def self.down
      remove_column :archiv
  end
end
