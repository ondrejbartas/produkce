class CreateWarehouseControls < ActiveRecord::Migration
  def self.up
    create_table :warehouse_controls do |t|
      t.integer :user_id
      t.string  :note
      t.timestamps
    end
  end

  def self.down
    drop_table :warehouse_controls
  end
end
