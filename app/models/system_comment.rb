class SystemComment < ActiveRecord::Base
      belongs_to :user
      
      has_many :system_comments
      belongs_to :system_comment
      
       attr_accessor  :showed
       
       def get_parrent 
         if !self.system_comment_id.blank?
           self.system_comment.get_parrent
         else
           self.id
         end
       end
end
