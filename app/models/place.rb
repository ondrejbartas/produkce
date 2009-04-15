class Place < ActiveRecord::Base
  has_many :works
  has_and_belongs_to_many :job_types
  validates_presence_of :name


  validates_uniqueness_of :name

  def is_job_type?(job_types)
    result = false
    self_job_types self.job_types
    job_types.each{|key,value|
      if value ==  "true"
        for self_job_type in self_job_types
          if key == self_job_type.id
            result = true
          end
        end  
      end
    }
    result
  end
end   
  
