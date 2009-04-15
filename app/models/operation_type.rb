class OperationType < ActiveRecord::Base
   has_and_belongs_to_many :job_types
   has_many :operations

   validates_presence_of :name, :type 

   TYPE_VALUES = {
    0 => "minutová sazba", 1 => "hodinová sazba",
    2 => "kusová sazba", 3 => "vysílačka",
    4 => "přepis",  5 => "prodej",  6 => "zkažený materiál"
    }

    


end
