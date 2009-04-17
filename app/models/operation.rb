class Operation < ActiveRecord::Base
  belongs_to :work
  belongs_to :operation_type
  belongs_to :tape_type
  belongs_to :finished_work
  
  def validate_on_create
    if self.operation_type.value == 0 && ( self.value.blank? || self.value == 0 )
        self.finished = ""
    elsif self.operation_type.value == 1 && ( self.value.blank? || self.value == 0 )
        self.finished = ""
    elsif self.operation_type.value == 2 && ( self.value.blank? || self.value == 0 )
        self.finished = ""
    elsif (self.operation_type.value == 3 || self.operation_type.value == 5 ||self.operation_type.value == 6 ) && ( self.count.blank? || self.tape_type_id.blank? )
        self.finished = ""
    elsif self.operation_type.value == 4 && ( self.count.blank? || self.value.blank? || self.tape_type_id.blank? || self.record_machine_id.blank? || self.player_machine_id.blank?)
        self.finished = ""
    end         
  end
  
  def validate_on_update
    if self.finished == true
      if self.operation_type.value == 0 && ( self.value.blank? || self.value == 0 )
          self.finished = ""
          errors.add_to_base("Zadejte počet minut")
      elsif self.operation_type.value == 1 && ( self.value.blank? || self.value == 0 )
          self.finished = ""
          errors.add_to_base("Zadejte čas")
      elsif self.operation_type.value == 2 && ( self.value.blank? || self.value == 0 )
          self.finished = ""
          errors.add_to_base("Zadejte počet kusů")
      elsif (self.operation_type.value == 3 || self.operation_type.value == 5 ||self.operation_type.value == 6 ) && ( self.count.blank? || self.tape_type_id.blank? )
          self.finished = ""
          errors.add_to_base("Zadejte počet kusů a jaký typ materiáu jste použili")
      elsif self.operation_type.value == 4 && ( self.count.blank? || self.value.blank? || self.tape_type_id.blank? || self.record_machine_id.blank? || self.player_machine_id.blank?)
          self.finished = ""
          errors.add_to_base("Zadejte počet kusů a jaký typ materiáu jste použili a jaké stroje")
      end         
    end
  end
end