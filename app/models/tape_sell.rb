class TapeSell < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :project
  belongs_to :tape_type
  validates_numericality_of :value, :greater_than => 0
  validates_numericality_of :price, :greater_than => 0
  validates_presence_of :user_id
  validates_presence_of :project_id
  validates_presence_of :tape_type_id
  
  
  
  before_validation :project_validation
  attr_accessor :sub_project_id
  
   def project_validation
      if not sub_project_id.blank?
        self.project_id = self.sub_project_id
      end
   end
end
