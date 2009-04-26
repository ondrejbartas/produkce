class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :limit => 40
      t.string :surname, :limit => 40
      t.string :fullname, :limit => 80
      t.string :login, :limit => 40
      t.string :password, :limit => 40
      t.integer :logout_time
      t.integer :role
      t.integer :active_role
      t.boolean :access
      t.boolean :deleted
      t.timestamps
    end

    us = User.create(:name => "admin", :surname=> "admin", :login => "admin", :password_new_comf => "admin", :password_new => "admin", :password => "admin", :role => 3)
  end

  def self.down
    drop_table :users
  end
end
