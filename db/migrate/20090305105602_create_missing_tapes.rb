class CreateMissingTapes < ActiveRecord::Migration
  def self.up
    create_table :missing_tapes do |t|
      t.integer :warehouse_control_id
      t.integer :tape_type_id
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :missing_tapes
  end
end
