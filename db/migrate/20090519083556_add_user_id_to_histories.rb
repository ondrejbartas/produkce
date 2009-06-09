class AddUserIdToHistories < ActiveRecord::Migration
  def self.up
      add_column :histories, :user_id, :integer
      add_column :histories, :model, :string
      add_column :histories, :history, :text
      
  end

  def self.down
      remove_column :histories, :user_id
      remove_column :histories, :model
      remove_column :histories, :history
  end
end
