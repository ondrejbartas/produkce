class CreateJobTypesPlaces < ActiveRecord::Migration
  def self.up
     create_table :job_types_places, :id => false do |t|
       t.column "place_id", :integer
       t.column "job_type_id", :integer
     end
     add_index "job_types_places", "place_id"
     add_index "job_types_places", "job_type_id"
  end

  def self.down
         drop_table :job_types_places
  end
end
