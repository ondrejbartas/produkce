class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

    create_table :categories_users, :id => false do |t|
       t.column "category_id", :integer
       t.column "user_id", :integer
     end
     add_index "categories_users", "category_id"
     add_index "categories_users", "user_id"
  end

  def self.down
    drop_table :categories
    drop_table :categories_users
  end
end
