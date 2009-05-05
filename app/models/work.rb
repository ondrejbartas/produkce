class Work < ActiveRecord::Base


  belongs_to :project
  belongs_to :user
  belongs_to :job_type
  belongs_to :place

  has_many :operations, :dependent => :destroy

  accepts_nested_attributes_for :operations, :allow_destroy => true, :reject_if => proc { |a| a['operation_type_id'].blank? }
  
  validates_presence_of :time
  validates_numericality_of :length, :greater_than => 0

  attr_accessor :sub_project_id, :without_project, :no_user

  before_validation :project_validation, :no_user_validation

  TIME_VALUES = {
      540 => "09:00", 570 => "09:30",
      600 => "10:00", 630 => "10:30",
      660 => "11:00", 690 => "11:30",
      720 => "12:00", 750 => "12:30",
      780 => "13:00", 810 => "13:30",
      840 => "14:00", 870 => "14:30",
      900 => "15:00", 930 => "15:30",
      960 => "16:00", 990 => "16:30",
      1020 => "17:00", 1050 => "17:30",
      1080 => "18:00", 1110 => "18:30",
      1140 => "19:00", 1170 => "19:30",
      1200 => "20:00", 1230 => "20:30",
      1260 => "21:00", 1290 => "21:30",
      1320 => "22:00", 1350 => "22:30",
      1380 => "23:00"

  }

  LENGTH_VALUES = {
    30 => "00:30", 60 => "01:00",
    90 => "01:30", 120 => " 02:00",
    150 => "02:30", 180 => " 03:00",
    210 => "03:30", 240 => " 04:00",
    270 => "04:30", 300 => " 05:00",
    330 => "05:30", 360 => " 06:00",
    390 => "06:30", 420 => " 07:00",
    450 => "07:30", 480 => " 08:00",
    540 => "09:00", 600 => "10:00",
    660 => "11:00", 720 => "12:00",
    780 => "13:00", 840 => "14:00",
    900 => "15:00", 960 => "16:00"

    }

   def project_validation
      if not sub_project_id.blank?
        self.project_id = self.sub_project_id
      end
   end
   def no_user_validation
       if self.no_user == true
         self.user_id = ""
       end
    end

   def get_from
     return self.date+self.time.minutes
   end
   
   def get_to
     return self.date+self.time.minutes + self.length.minutes
   end
end
