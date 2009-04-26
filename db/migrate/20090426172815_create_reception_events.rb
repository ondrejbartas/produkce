class CreateReceptionEvents < ActiveRecord::Migration
  def self.up
    create_table :reception_events do |t|
      t.string :name
      t.string :note
      t.date :from
      t.date :to
      
      t.boolean :parking
      t.boolean :alert
      t.boolean :notice

      t.timestamps
    end
  end

  def self.down
    drop_table :reception_events
  end
end
