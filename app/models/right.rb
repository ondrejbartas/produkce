class Right < ActiveRecord::Base
  
  
  def check?(user, user_id)
    if self.value % user.active_role == 0
      true
    elsif self.mine == true  && user_id == user.id
      true
    else
      false
    end  
  end
end
