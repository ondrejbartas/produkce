class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :user_id
      t.string :text
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
