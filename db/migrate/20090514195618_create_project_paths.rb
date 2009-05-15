class CreateProjectPaths < ActiveRecord::Migration
  def self.up
    create_table :project_paths do |t|
      t.string :path
      t.integer :project_id
      t.integer :user_id
      t.integer :value

      t.timestamps
    end
   
  end

  def self.down
    drop_table :project_paths
  end
end
