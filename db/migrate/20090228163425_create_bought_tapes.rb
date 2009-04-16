class CreateBoughtTapes < ActiveRecord::Migration
  def self.up
    create_table :bought_tapes do |t|
      t.integer :purchase_cart_id
      t.integer :tape_type_id
      t.integer :price
      t.integer :value
      t.string  :note

      t.timestamps
    end
  end

  def self.down
    drop_table :bought_tapes
  end
end
