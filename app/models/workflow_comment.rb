class WorkflowComment < ActiveRecord::Base
  belongs_to :user

  has_many :workflow_comments
  belongs_to :workflow_comment



   attr_accessor  :showed

   def get_parrent 
     if !self.workflow_comment_id.blank?
       self.workflow_comment.get_parrent
     else
       self.id
     end
   end
   
   def get_note
        self.note.gsub(/\n/, '<br>')
   end

end
