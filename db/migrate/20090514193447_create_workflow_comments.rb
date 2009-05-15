class CreateWorkflowComments < ActiveRecord::Migration
  def self.up
    create_table :workflow_comments do |t|
         t.integer :user_id
          t.integer :workflow_comment_id
          t.string :note
          t.boolean :finished
          t.boolean :archiv
          t.boolean :storno
          
      t.timestamps
    end
  end

  def self.down
    drop_table :workflow_comments
  end
end
