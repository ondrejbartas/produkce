class CreateOperations < ActiveRecord::Migration
  def self.up
    create_table :operations do |t|
      t.integer :work_id
      t.integer :finished_work_id
      t.integer :operation_type_id
      t.integer :value
      t.integer :tape_type_id
      t.integer :player_machine_id
      t.integer :record_machine_id
      t.boolean :finished
      t.boolean :their_tape

      t.string  :note
      t.timestamps
    end
  end

  def self.down
    drop_table :operations
  end
end
