class ProjectPath < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  VALUES = {
    0 => "Avid offline projekt", 1 => "Avid DS projekt",
    2 => "export pro zvukaře", 3 => "export pro DS",
    4 => "export V/A", 5 => "podklady pro offline od klienta",
    6 => "podklady pro DS od klienta"
    }
end
