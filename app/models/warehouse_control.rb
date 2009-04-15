class WarehouseControl < ActiveRecord::Base
   has_many :missing_tapes, :dependent => :destroy
   belongs_to :user
   accepts_nested_attributes_for :missing_tapes, :allow_destroy => true, :reject_if => proc { |a| a['tape_type_id'].blank? }

   validates_presence_of :user_id

end
