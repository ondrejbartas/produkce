class FinishedWorksController < ApplicationController
  # GET /finished_works
  # GET /finished_works.xml
  def index

    @user = @current_user
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @finished_works }
    end
  end


  def chose_user_as_produce

     @users = User.find(:all, :conditions  => [" MOD(role, 5) = 0 OR  MOD(role, 17) = 0"])
    
     @finished_work = FinishedWork.new
     
      if !session["act_as_user_id"].blank?
        @user = User.find(session["act_as_user_id"])
      end
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @finished_works }
      end
    end


  def finish_operation_as_produce
     if params[:act_as_user_id].blank? && session["act_as_user_id"].blank?
      render  :inline =>"vyberte operátora"
     elsif params[:act_as_user_id].blank?
       params[:act_as_user_id] = session["act_as_user_id"]
     else 
       session["act_as_user_id"] = params[:act_as_user_id]
     end
     if !params[:act_as_user_id].blank?
       @user = User.find(params[:act_as_user_id])
       @finished_work = FinishedWork.new
       render :partial=>"finished_works/finish_operation_as_produce" 
     else
       render  :inline =>"vyberte uživatele"
     end
  end



  # GET /finished_works/1
  # GET /finished_works/1.xml
  def show
    @finished_work = FinishedWork.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @finished_work }
    end
  end

  # GET /finished_works/new
  # GET /finished_works/new.xml
  def new
    @finished_work = FinishedWork.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @finished_work }
    end
  end

  # GET /finished_works/1/edit
  def edit
    @finished_work = FinishedWork.find(params[:id])
  end

  # POST /finished_works
  # POST /finished_works.xml
  def create
    saved = false
    if not params['finished_work_form'].blank?
        params['finished_work_form'].each { |key ,value|
           if params[:finished_work_form][key][:value] != "0"
               @finished_work = FinishedWork.new()
               @finished_work.user_id = @current_user.id
               @finished_work.value = params[:finished_work_form][key][:value]
               if !(@current_user.produce? || @current_user.admin?)
                     @finished_work.status = 0
               else 
                     @finished_work.status = 1
               end
               if @finished_work.save
                  saved = true
                  params[:finished_work_form][key][:operations].each { |key ,operation_id|
                          operation = Operation.find_by_id(key)
                          operation.finished_work_id = @finished_work.id
                          operation.save
                   }
               end

           end
         }
     end
    

    respond_to do |format|
      if saved
        flash[:notice] = 'FinishedWork was successfully created.'
        format.html { redirect_to session['saved_location'] }
        format.xml  { render :xml => @finished_work, :status => :created, :location => @finished_work }
      else
        format.html { redirect_to(menu_home_url) }
        format.xml  { render :xml => @finished_work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /finished_works/1
  # PUT /finished_works/1.xml
  def update
    @finished_work = FinishedWork.find(params[:id])

     if !(@current_user.produce? || @current_user.admin?)
        @finished_work.status = 0
     else 
        @finished_work.status = 1
     end
    respond_to do |format|
      if @finished_work.update_attributes(params[:finished_work])
        flash[:notice] = 'FinishedWork was successfully updated.'
        redirect_to session['saved_location']
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @finished_work.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /finished_works/1
  # DELETE /finished_works/1.xml
  def destroy
    @finished_work = FinishedWork.find(params[:id])
    @finished_work.destroy

    respond_to do |format|
      format.html { redirect_to(finished_works_url) }
      format.xml  { head :ok }
    end
  end
  
  
  def change_value
     @finished_work = FinishedWork.find(params[:id])

      if !params[:value].blank?
         @finished_work.value = params[:value]
         @finished_work.save
      end
      
      if request.xml_http_request?
         render :partial => "change_value", :layout => false
       end
       
   end
   
   def correct
      @finished_work = FinishedWork.find(params[:id])


        @finished_work.status = 1
        @finished_work.save
        if request.xml_http_request?
           render :partial => "correct", :layout => false
         end

    end
end
