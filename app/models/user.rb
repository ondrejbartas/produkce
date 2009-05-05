require 'digest/sha1'

class User < ActiveRecord::Base
  
  
   has_many :projects
   has_many :contacts
   has_many :jobs
   has_many :system_comments
   has_many :comments
   has_many :histories
   has_many :works
   has_many :finished_works
   has_many :purchase_carts
   has_many :warehouse_controls
   has_many :tape_sells
   
   has_and_belongs_to_many :categories
   has_and_belongs_to_many :companies, :join_table => "companies_users",  :readonly => true

   before_validation :password_validation
   before_validation :role_validation
   validates_presence_of :login, :name, :surname
   validates_format_of :login, :with => /[-a-zA-Z0-9]+$/
   validates_length_of :login, :within => 3..40
   validates_length_of :name, :within => 3..40
   validates_uniqueness_of :login, :case_sensitive => false

   
   after_validation :crypt_password
   after_validation :fill_fullname
   after_validation :fill_logout_time

   attr_accessor  :password_new, :password_new_comf, :role3,:role5,:role7,:role11,:role13,:role17,:role23

  def self.authenticate(login, password)
    find_by_login_and_password(login, Digest::SHA1.hexdigest(password))
  end

   LOGOUT_TIME_VALUES = {
    2 => "2 minuty",
    10 => "10 minut",
    30 => "30 minut",
    60 => "1 hodina",
    120 => "2 hodiny",
    240 => "4 hodiny",
    480 => "8 hodin"
    }

 #   ad = Role.create(:idd=> "3", :name => "ADMIN", :comment => "admimnistrátor")
 #   wo = Role.create(:idd=> "5", :name => "WORKER", :comment => "pracovník")
 #  pro = Role.create(:idd=> "7", :name => "PRODUCE", :comment => "produkční")
 #   acc = Role.create(:idd=> "11", :name => "ACCOUNTANT", :comment => "účetní")
 #   cli = Role.create(:idd=> "13", :name => "CLIENT", :comment => "klient")
 #   exw = Role.create(:idd=> "17", :name => "EXTWORKER", :comment => "externí pracovník")

  def is_worker?
      if( self.role % 5 == 0 )
        true
      else
        false
      end
  end
  
  def is_admin?
      if( self.role % 3 == 0 )
        true
      else
        false
      end
  end

  def is_produce?
      if( self.role % 7 == 0 )
        true
      else
        false
      end
  end

  def worker?
      if( self.active_role == 5 )
        true
      else
        false
      end
  end

  def admin?
    if( self.active_role == 3 )
        true
      else
        false
      end
  end

   def accountant?
      if( self.active_role == 11)
        true
      else
        false
      end
  end

  def produce?
      if( self.active_role == 7)
        true
      else
        false
      end
  end

  def client?
      if( self.active_role ==  13)
        true
      else
        false
      end
  end

 def extworker?
      if( self.active_role == 17)
        true
      else
        false
      end
  end
  
  def recepce?
      if( self.active_role == 23)
        true
      else
        false
      end
  end


  def mine?(item)
      if admin?
        true
      else
        item.user_id == self.id
      end
   end

  private



   def crypt_password
      if !password_new_comf.blank? && !password_new.blank?
       self.password = Digest::SHA1.hexdigest(password_new)
      end
   end


    def password_validation
      if password_new_comf.blank? && password_new.blank?

      elsif ( password_new != password_new_comf)
          errors.add_to_base("zadaná hesla se nerovnají")
          false
      end
    end
    
    
    def role_validation
      if self.active_role.blank?
        if role % 3 == 0
          self.active_role = 3
        elsif role % 5 == 0
          self.active_role = 5          
        elsif role % 7 == 0
          self.active_role = 7         
        elsif role % 11 == 0
          self.active_role = 11          
        elsif role % 13 == 0
          self.active_role = 13          
        elsif role % 17 == 0
          self.active_role = 17
        elsif role % 23 == 0
          self.active_role = 23
        end          
      end
    end

    def fill_fullname
      self.fullname = surname + " " + name
    end


    def fill_logout_time
      if self.logout_time.blank?
         self.logout_time = 10
      end
    end
end

