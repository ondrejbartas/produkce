class ReceptionContact < ActiveRecord::Base
    has_and_belongs_to_many :reception_categories
    
end
