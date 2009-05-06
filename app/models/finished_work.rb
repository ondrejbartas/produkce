class FinishedWork < ActiveRecord::Base
   has_many :operations
   belongs_to :user
   
   
   STATUS_VALUES = {
        0 => "ke kontrole", 1 => "kontroloval produkční"
    }
    
    
     def get_history_text
       self.status+";"+self.value+";"+self.user_id+";"+self.note
     end
end
