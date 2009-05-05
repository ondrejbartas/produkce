class Contact < ActiveRecord::Base
  default_scope :conditions => 'deleted is not true'
  
  belongs_to :user
  belongs_to :company
  

end
