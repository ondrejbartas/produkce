class CreateUpdateLogs < ActiveRecord::Migration
  def self.up
    create_table :update_logs do |t|
      t.string :note

      t.timestamps
    end
  end

  def self.down
    drop_table :update_logs
  end
end
