class Company < ActiveRecord::Base

   has_and_belongs_to_many :users, :join_table => "companies_users",  :readonly => true
   has_many :projects
   has_many :contacts
   
   validates_presence_of :name
   validates_uniqueness_of :name
   
   
   def write_history(current_user)
      history = ""  
      self.name.nil? ? history += ";" : history += self.name+";"
      self.ico.nil? ? history += ";" : history += self.ico+";"
      self.dic.nil? ? history += ";" : history += self.dic+";"
      self.account.nil? ? history += ";" : history += self.account+";"
      self.deleted.nil? ? history += ";" : history += self.deleted+";"
      
      @history = History.new( :user_id => current_user.id, :model => "company", :history => history )
      @history.save
      
      parse_history(@history)
   end
    
    
   def parse_history(history_text)
     
     hs = history_text.split(";")
     
     out = Hash.new(:name => hs.get(0), :ico => hs.get(1))
     
     return out
   end
   
   
end
