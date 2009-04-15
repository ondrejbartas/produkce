class TapeType < ActiveRecord::Base
   has_many :missing_tapes
   has_many :bought_tapes
   has_many :operations
end
