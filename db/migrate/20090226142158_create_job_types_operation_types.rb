class CreateJobTypesOperationTypes < ActiveRecord::Migration
  def self.up
     create_table :job_types_operation_types, :id => false do |t|
       t.column "operation_type_id", :integer
       t.column "job_type_id", :integer
     end
     add_index "job_types_operation_types", "operation_type_id"
     add_index "job_types_operation_types", "job_type_id"
  end

  def self.down
         drop_table :job_types_operation_types
  end
end

