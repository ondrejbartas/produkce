class CreateOperatorPlans < ActiveRecord::Migration
  def self.up
      create_table :operator_plans do |t|
        
      t.integer :user_id
      t.date :date
      t.integer :from
      t.integer :to
      t.string  :note
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :operator_plans
  end
end
