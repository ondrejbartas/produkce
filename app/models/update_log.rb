class UpdateLog < ActiveRecord::Base
  
  
  def get_note
       self.note.gsub(/\n/, '<br>')
  end
end
