class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :name
      t.string :note
      t.string :photo
      t.timestamp :startDate
      t.timestamp :endDate
      t.boolean :deleted
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
 