class Company < ActiveRecord::Base
  default_scope :conditions => 'deleted is not true'

   has_and_belongs_to_many :users, :join_table => "companies_users",  :readonly => true
   has_many :projects
   has_many :contacts
   
   validates_presence_of :name
   validates_uniqueness_of :name
end
