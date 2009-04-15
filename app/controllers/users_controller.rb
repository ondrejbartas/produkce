class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.find(:all , :conditions => "deleted is null").sort_by {|u| u.surname.downcase}

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  def change_atributes
     
  end

  # GET /users/1
  # GET /users/1.xml
  def show
      @user = User.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @user }
      end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
   
       @user = User.new
       if not params[:company_id].blank?
          @user.company_id = params[:company_id]
       end
       @user.access = false
       respond_to do |format|
         format.html # new.html.erb
         format.xml  { render :xml => @user }
       end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  
  end

  # POST /users
  # POST /users.xml
  def create
   
        @user = User.new(params[:user])

         if not params[:contact][:phone].blank?
           @user.contacts.build(params[:contact])
           @contacts = Contact.new(params[:contact])
         end

         if not params[:user][:category_ids].blank?
            @user.category_ids = params[:user][:category_ids]
         end

         if params[:user][:active_role].blank?
            @user.role = 1
            if !params[:role3].blank? then @user.role *= 3 end
            if !params[:role5].blank? then @user.role *= 5 end
            if !params[:role7].blank? then @user.role *= 7 end
            if !params[:role11].blank? then @user.role *= 11 end
            if !params[:role13].blank? then @user.role *= 13 end
            if !params[:role17].blank? then @user.role *= 17 end
            if !params[:role23].blank? then @user.role *= 23 end
         end

      respond_to do |format|
        if @user.save
          flash[:notice] = 'User was successfully created.'
          format.html { redirect_to(@user) }
          format.xml  { render :xml => @user, :status => :created, :location => @user }
        else
           @contacts = @user.contacts
           format.html { render :action => "new" }
           format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }

        end
  end

 
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])
   

      respond_to do |format|
          if @user.update_attributes(params[:user])

          if  @current_user.admin? || @current_user.produce?
              if not params[:user][:category_ids].blank?
                  @user.category_ids = params[:user][:category_ids]
               end

               if params[:user][:active_role].blank?
                  @user.role = 1
                  if !params[:role3].blank? then @user.role *= 3 end
                  if !params[:role5].blank? then @user.role *= 5 end
                  if !params[:role7].blank? then @user.role *= 7 end
                  if !params[:role11].blank? then @user.role *= 11 end
                  if !params[:role13].blank? then @user.role *= 13 end
                  if !params[:role17].blank? then @user.role *= 17 end
                  if !params[:role23].blank? then @user.role *= 23 end
               end
          end
            
            @user.save
            flash[:notice] = 'User was successfully updated.'

            format.html { redirect_to(@user) }
            format.xml  { head :ok }
          else
               format.html { render :action => "edit" }
               format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
          end

    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
 def destroy
    @user = User.find(params[:id])
  

     if @user.deleted
        @user.deleted = false
      else
        @user.deleted = true
      end
      @user.save

      respond_to do |format|
        format.html { redirect_to(users_url) }
        format.xml  { head :ok }
      end
    end

end