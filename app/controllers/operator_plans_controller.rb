class OperatorPlansController < ApplicationController
  # GET /operator_plans
  # GET /operator_plans.xml
  def index
    @operator_plans = OperatorPlan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @operator_plans }
    end
  end

  # GET /operator_plans/1
  # GET /operator_plans/1.xml
  def show
    @operator_plan = OperatorPlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @operator_plan }
    end
  end

  # GET /operator_plans/new
  # GET /operator_plans/new.xml
  def new
    @users = User.find(:all, :conditions => "role % 5 = 0", :order => "fullname")
    @value = 1
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @operator_plan }
    end
  end
  
  
  # GET /operator_plans/new
  # GET /operator_plans/new.xml
  def new_recepce
    @users = User.find(:all, :conditions => "role % 23 = 0", :order => "fullname")
    @value = 0
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @operator_plan }
    end
  end
  
  # GET /operator_plans/new
   # GET /operator_plans/new.xml
   def edit_operator
     @value = 1
     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @operator_plan }
     end
   end
   
   # GET /operator_plans/new
    # GET /operator_plans/new.xml
    def edit_recepce
      @value = 0
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @operator_plan }
      end
    end
    
  # GET /operator_plans/1/edit
  def edit
    @operator_plan = OperatorPlan.find(params[:id])
  end

  # POST /operator_plans
  # POST /operator_plans.xml

    def create
       flash[:notice] = ""
       saved = true
       @value = 1
       if !params[:op_plans].blank?
           params[:op_plans].each { |key ,plan|

             @operator_plan = OperatorPlan.new(params[:op_plans][key][:operator_plan])
             if !@operator_plan.save
               @value = @operator_plan.value
               @operator_plan_error = @operator_plan
               saved = false
             else
               flash[:notice] +="provedeno naplanovani sluzby na cas: "+ Time.parse(plan[:operator_plan][:date]).strftime("%d.%m.%Y")+" pro: "+@operator_plan.user.fullname+"<br />" 
             end
           }
       else 
           saved = false  
       end

       if !@operator_plan_error.blank?
         @operator_plan = @operator_plan_error
       end 
       respond_to do |format|
         if saved == true
            if @value == 1
             format.html { redirect_to :controller => "operator_plans", :action => "index" }
            else 
              format.html { redirect_to :controller => "operator_plans", :action => "index_recepce" }
            end
         else
           @type =  1
           @users = User.find(:all, :conditions => "role % 5 = 0", :order => "fullname")
           
           format.html { render :action => "new" }
           format.xml  { render :xml => @work.errors, :status => :unprocessable_entity }
         end
       end
     end

  # PUT /operator_plans/1
  # PUT /operator_plans/1.xml
  def update
    @operator_plan = OperatorPlan.find(params[:id])

    respond_to do |format|
      if @operator_plan.update_attributes(params[:operator_plan])
        flash[:notice] = 'OperatorPlan was successfully updated.'
        if @operator_plan.value == 1
         format.html { redirect_to :controller => "operator_plans", :action => "index" }
        else 
          format.html { redirect_to :controller => "operator_plans", :action => "index_recepce" }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @operator_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /operator_plans/1
  # DELETE /operator_plans/1.xml
  def destroy
    @operator_plan = OperatorPlan.find(params[:id])
    @operator_plan.destroy

    respond_to do |format|
      format.html { redirect_to(operator_plans_url) }
      format.xml  { head :ok }
    end
  end
  
  
  # DELETE /operator_plans/1
  # DELETE /operator_plans/1.xml
  def delete_operator_plan
    @operator_plan = OperatorPlan.find(params[:operator_plan_id])
    @operator_plan.destroy

    render  :inline =>"smazano"
  end
  
  
  def add_new_user_plan

      @user = User.find(params[:user_id])
      if params[:preset] == "startday"
          @selected_from = 450
          @selected_to = 840
      elsif params[:preset] == "endday"
          @selected_from = 720
          @selected_to = 1080
      else 
          @selected_from = 450
          @selected_to = 1080
      end 
      @date = Time.parse(params[:date])
      @value = params[:value]
      render :partial => 'operator_plans/add_new_user_cell'
                  
  end
end
