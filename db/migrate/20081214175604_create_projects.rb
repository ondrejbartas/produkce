class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.integer :status
      t.string :note
      t.boolean :deleted
      t.integer :company_id
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
