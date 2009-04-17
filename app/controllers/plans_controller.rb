class PlansController < ApplicationController
  def week
    
       if !params['add_week'].blank?
          session[:calendar_start_date] += 7
          @start_date = session[:calendar_start_date]
       elsif !params['substract_week'].blank?
          session[:calendar_end_date] -= 7
          @start_date = session[:calendar_end_date]
       elsif  params[:job_type].blank? && params[:show_type].blank? 
          @start_date = 0
          session[:calendar_start_date] = @start_date
          session[:calendar_end_date] = @start_date
       else 
          @start_date = 0
       end
       
       if params[:job_type].blank? 
         @filtr_type = { "1" => "true" }
       else
          @filtr_type = params[:job_type]
       end
       
       if params[:show_type].blank? 
          @filtr_show_type = { "1" => "true" }
       else
          @filtr_show_type = params[:show_type]
       end
       
       
       @places = Place.find(:all).sort_by {|u| u.name.downcase}
       for place in Place.find(:all)
         inside = false
         for job_type in place.job_types
           @filtr_type.each{|key, value|
               if job_type.id.to_s == key
                  inside = true
               end
           }
         end 
         
         if inside == false
           @places.delete(place)
         end
       end   
       
      
       
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @places }
      end
  end


  def change_place_date
      
      if params[:job_type].blank? 
         @filtr_type = { "1" => "true" }
      else
         @filtr_type = params[:job_type]
      end
      
     
      if params[:show_type].blank? 
         @filtr_show_type = { "1" => "true" }
      else
         @filtr_show_type = params[:show_type]
      end
        
      @planed_work = Work.find(params[:planed_work_id])
      
      @planed_work.place_id = params[:place_id].to_i
      @planed_work.time = Time.parse(params[:date]) + (@planed_work.time.strftime("%H").to_i * 60 +  @planed_work.time.strftime("%M").to_i ).minutes
      
      
      
      @planed_work.save
      render :partial => 'plans/add_cell', :locals => {:planed_work => @planed_work}
                  
  end

  def add_week_calendar
        if not params[:start_date].blank?
            @start_date = params[:start_date].to_i
            session[:calendar_start_date] = @start_date
        elsif not params['add_week'].blank?
            session[:calendar_start_date] += 7
            @start_date = session[:calendar_start_date]
        elsif not params['substract_week'].blank?
             session[:calendar_end_date] -= 7
             @start_date = session[:calendar_end_date]
        end
        
        if params[:job_type].blank? 
           @filtr_type = { "1" => "true" }
        else
           @filtr_type = params[:job_type]
        end
        
       
        if params[:show_type].blank? 
           @filtr_show_type = { "1" => "true" }
        else
           @filtr_show_type = params[:show_type]
        end
          
        @places = Place.find(:all).sort_by {|u| u.name.downcase}
        for place in Place.find(:all)
           inside = false
           for job_type in place.job_types
             @filtr_type.each{|key, value|
                 if job_type.id.to_s == key
                    inside = true
                 end
             }
           end 

           if inside == false
             @places.delete(place)
           end
        end
        render(:layout=>false)
        
    
  end

  def add_calendar_work
    if not params[:job_type_id].blank?
       @job_type = JobType.find_by_id(params[:job_type_id])
       @user = User.find_by_id(params[:user_id])
       if params[:sub_project_id].blank?
          @project = Project.find_by_id(params[:project_id])
       else
          @project = Project.find_by_id(params[:sub_project_id])
       end

       if not params[:start_date].blank?
          @start_date = params[:start_date].to_i
          session[:calendar_start_date] = @start_date
       elsif not params['add_week'].blank?
          session[:calendar_start_date] += 7
          @start_date = session[:calendar_start_date]
       end
       render(:layout=>false)
    else
       render  :inline =>"chyba při zadávání! Nechte si znovu stránku načíst."
    end                
  end

  def add_date
     @place_id = params[:place_id]
     @date = params[:date]
     render(:layout=>false)
  end

  def month
  end

end
