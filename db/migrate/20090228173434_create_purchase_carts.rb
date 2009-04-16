class CreatePurchaseCarts < ActiveRecord::Migration
  def self.up
    create_table :purchase_carts do |t|
      t.string :store
      t.string :url
      t.timestamp :purchase_date
      t.string :note
      t.integer :user_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_carts
  end
end
