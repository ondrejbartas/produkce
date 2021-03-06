class Project < ActiveRecord::Base

  
  has_many :projects
  belongs_to :project
  has_one :invoice
  belongs_to :user
  belongs_to :company
  has_many :works
  has_many :comments
  has_many :tape_sells
  
  has_many :project_paths
  
  validates_presence_of :name, :status, :user_id

   STATUS_VALUES = {
    0 => "v jednání",
    1 => "zakázka", 2 => "ukončen",
    3 => "k fakturaci",
    4 => "vyfakturován", 5 => "zaplacen",
    6 => "stornován"
    }
    
  def project_name 
    if self.project_id.blank?
      return self.name
    else
      return self.project.name+" "+self.name
    end
  end  
  
  def user_name 
     if self.user_id.blank?
       return ""
     else
       return self.user.fullname
     end
  end
   
  def company_name 
      if self.company_id.blank?
        return ""
      else
        return self.company.name
      end
  end
   
   
    def get_history_text
      self.name+";"+self.company_id+";"+self.project_id+";"+self.status+";"+self.deleted+";"+self.user_id+";"+self.note
    end
end
