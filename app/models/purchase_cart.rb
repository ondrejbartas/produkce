class PurchaseCart < ActiveRecord::Base
   has_many :bought_tapes, :dependent => :destroy
   belongs_to :user
   validates_presence_of :store

   accepts_nested_attributes_for :bought_tapes, :allow_destroy => true, :reject_if => proc { |a| a['tape_type_id'].blank? }

   
end
