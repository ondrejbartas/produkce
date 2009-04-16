class CreateOperationTypes < ActiveRecord::Migration
  def self.up
    create_table :operation_types do |t|
      t.string :name
      t.string :note
      t.integer :value
      t.integer :price
      
      t.timestamps
    end
  end

  def self.down
    drop_table :operation_types
  end
end
