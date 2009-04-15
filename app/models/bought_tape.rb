class BoughtTape < ActiveRecord::Base
   belongs_to :purchase_cart
   has_one :tape_type
   validates_presence_of :tape_type_id, :value
   
end
