class Machine < ActiveRecord::Base

   validates_presence_of :name, :price
end
