class CreateRights < ActiveRecord::Migration
  def self.up
    create_table :rights do |t|
      t.string :controller
      t.string :action
      t.string :sub
      t.integer :value
      t.boolean :mine
      t.timestamps
    end
  end

  def self.down
    drop_table :rights
  end
end
