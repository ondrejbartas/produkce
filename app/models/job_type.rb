class JobType < ActiveRecord::Base
  
  has_many :works
  has_and_belongs_to_many :places, :order=>'name'
  has_and_belongs_to_many :operation_types

  validates_presence_of :name


  DAY_NAMES = { 0 => "PO", 1 => "ÚT", 2 => "ST", 3 => "ČT", 4 => "PÁ", 5 => "SO", 6 => "NE" }
end
