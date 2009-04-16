class CreateTapeTypes < ActiveRecord::Migration
  def self.up
    create_table :tape_types do |t|
      t.string :name
      t.string :note
      t.integer :tape_price
      t.integer :master_price
      t.boolean :master
      t.integer :limit
      t.integer :order
      t.timestamps
    end
  end

  def self.down
    drop_table :tape_types
  end
end
