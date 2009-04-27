class CreateReceptionCategories < ActiveRecord::Migration
  def self.up
    create_table :reception_categories do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end
    
    
    create_table :reception_categories_reception_contacts, :id => false do |t|
       t.column "reception_category_id", :integer
       t.column "reception_contact_id", :integer
     end
     add_index "reception_categories_reception_contacts", "reception_category_id"
     add_index "reception_categories_reception_contacts", "reception_contact_id"
  end

  def self.down
    drop_table :reception_categories
    drop_table :reception_categories_reception_contacts
  end
end
