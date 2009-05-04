class CreateTapeSells < ActiveRecord::Migration
  def self.up
    create_table :tape_sells do |t|

      t.integer :project_id
      t.integer :tape_type_id
      t.integer :value
      t.integer :user_id
      t.string :note
      t.integer :price
      
      t.timestamps
    end
  end

  def self.down
    drop_table :tape_sells
  end
end
