class CreateFinishedWorks < ActiveRecord::Migration
  def self.up
    create_table :finished_works do |t|
      t.string :note
      t.integer :status
      t.integer :value
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :finished_works
  end
end
