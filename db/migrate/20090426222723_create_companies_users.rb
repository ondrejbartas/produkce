class CreateCompaniesUsers < ActiveRecord::Migration
  def self.up
     create_table :companies_users, :id => false do |t|
         t.column "company_id", :integer
         t.column "user_id", :integer
       end
       add_index "companies_users", "company_id"
       add_index "companies_users", "user_id"
    end

    def self.down
      drop_table :companies_users
    end
end
