class Company < ActiveRecord::Base
   has_many :users
   has_many :projects
   has_many :contacts
   
   validates_presence_of :name
   validates_uniqueness_of :name
end
