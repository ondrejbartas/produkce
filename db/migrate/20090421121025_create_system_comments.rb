class CreateSystemComments < ActiveRecord::Migration
  def self.up
    create_table :system_comments do |t|
      t.integer :user_id
      t.string :note
      t.boolean :finished

      t.timestamps
    end
  end

  def self.down
    drop_table :system_comments
  end
end
