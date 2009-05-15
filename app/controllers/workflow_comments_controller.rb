class WorkflowCommentsController < ApplicationController
  # GET /workflow_comments
  # GET /workflow_comments.xml
  def index
    @workflow_comments = WorkflowComment.find(:all).sort_by {|u| u.created_at}.reverse

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @workflow_comments }
    end
  end

  # GET /workflow_comments/1
  # GET /workflow_comments/1.xml
  def show
    @workflow_comment = WorkflowComment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @workflow_comment }
    end
  end

  # GET /workflow_comments/new
  # GET /workflow_comments/new.xml
  def new
    @workflow_comment = WorkflowComment.new
    if !params[:workflow_comment_id].blank?
      @workflow_comment_id = params[:workflow_comment_id]
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @workflow_comment }
    end
  end

  # GET /workflow_comments/1/edit
  def edit
    @workflow_comment = WorkflowComment.find(params[:id])
  end

  # POST /workflow_comments
  # POST /workflow_comments.xml
  def create
    @workflow_comment = WorkflowComment.new(params[:workflow_comment])

    respond_to do |format|
      if @workflow_comment.save
        flash[:notice] = 'WorkflowComment was successfully created.'
        format.html { redirect_to(workflow_comments_url) }
        format.xml  { render :xml => @workflow_comment, :status => :created, :location => @workflow_comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @workflow_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /workflow_comments/1
  # PUT /workflow_comments/1.xml
  def update
    @workflow_comment = WorkflowComment.find(params[:id])

    respond_to do |format|
      if @workflow_comment.update_attributes(params[:workflow_comment])
        flash[:notice] = 'WorkflowComment was successfully updated.'
        format.html { redirect_to(workflow_comments_url)  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @workflow_comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /workflow_comments/1
  # DELETE /workflow_comments/1.xml
  def destroy
    @workflow_comment = WorkflowComment.find(params[:id])
    @workflow_comment.destroy

    respond_to do |format|
      format.html { redirect_to(workflow_comments_url) }
      format.xml  { head :ok }
    end
  end
  
  
  
  def add_form
      @workflow_comment = WorkflowComment.new
      if !params[:id].blank?
        @workflow_comment_id = params[:id]
      end
      render(:layout=>false)                  
   end
   
   def finished
       @workflow_comment = WorkflowComment.find(params[:id])
       @workflow_comment.finished = true
       @workflow_comment.save
       
       redirect_to(workflow_comments_url)
    end
    
     def archiv
         @workflow_comment = WorkflowComment.find(params[:id])
         @workflow_comment.archiv = true
         @workflow_comment.save

         redirect_to(workflow_comments_url)
      end
    
    
     def storno
         @workflow_comment = WorkflowComment.find(params[:id])
         @workflow_comment.storno = true
         @workflow_comment.save

         redirect_to(workflow_comments_url)
     end
end
