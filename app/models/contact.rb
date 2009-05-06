class Contact < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :company
  
   def get_history_text
     self.address+";"+self.email+";"+self.phone+";"+self.note+";"+self.deleted
   end
end
