class Postoffice < ActionMailer::Base
  

  def new_work(name, email)
     @recipients   = mail
     @from         = "produkce@pokrok.com"
     @subject      = "Nová práce :-)"
     @sent_on      = Time.now
     @content_type = "text/html"

     body[:name]  = name
     body[:email] = email       
   end
   
end
