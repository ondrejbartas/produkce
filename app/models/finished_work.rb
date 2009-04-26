class FinishedWork < ActiveRecord::Base
   has_many :operations
   belongs_to :user
   
   
   STATUS_VALUES = {
        0 => "ke kontrole", 1 => "kontroloval produkční"
    }
    
end
