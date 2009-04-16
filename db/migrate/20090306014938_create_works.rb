class CreateWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      t.string :note

      t.timestamp :time
      t.integer :length


      t.boolean :reserved
      t.boolean :deleted
      t.boolean :edited

      t.integer :project_id
      t.integer :job_type_id
      t.integer :user_id
      t.integer :place_id

      t.timestamps
    end
  end

  def self.down
    drop_table :works
  end
end
