# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '8c597388af017743bac1df1a5d278c01'

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  # filter_parameter_logging :password

  before_filter :auth
  before_filter :require_login, :except => [:login]
  before_filter :set_timezone

  before_filter :rights

  helper_method :current_user

  # Authorise user if possible
  def auth
    unless session[:user_id].nil? || session[:lastLogin].nil? then
      @current_user_login = User.find(session[:user_id])
      if session[:lastLogin] > Time.now - @current_user_login.logout_time.minutes
         @current_user = @current_user_login
         @activePage = session[:activePage]
         session[:lastLogin] = Time.now
      end
    end
  end

  def current_user
    @current_user
  end

  # Require login
  def require_login
     redirect_to '/login' unless @current_user
  end

  def set_timezone
    # current_user.time_zone #=> 'London'
    Time.zone = 'Prague'
  end
  
  def rights
    
    rights = Right.find(:all, :conditions=>[ " controller = ? AND action = ? ", params[:controller], params[:action]])
    
    allowed = false
    
    if params[:controller] == 'users'
      user_id = params[:id].to_i
    else
      user_id = params[:user_id].to_i
    end
    
    if rights.size > 0
      for right in rights
        if right.check?(@current_user, user_id)
          allowed = true
        end
      end  
    else 
      allowed = true
    end
    
    
    if allowed == false
        flash[:error] = 'Nemáte oprávnění vidět danou stránku! Pokud si myslíte, že je to chyba napište administrátorovi: ondrej.bartas@pokrok.com'
        redirect_to :controller => 'account', :action => 'menu_home'
    end 
  end
end
