class MissingTape < ActiveRecord::Base
   belongs_to :warehouse_control
   belongs_to :tape_type
end
