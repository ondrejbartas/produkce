module WorkflowCommentsHelper


  def workflow_comment_show(id, finished, archiv = false)
    workflow_comment = WorkflowComment.find(id)
    
    if workflow_comment.archiv == true || archiv == true
       if workflow_comment.workflow_comments.size > 0
            for comment in workflow_comment.workflow_comments.sort_by {|u| u.created_at}
              for showed_comment in @workflow_comments
                if showed_comment.id == comment.id
                  showed_comment.showed = true
                elsif showed_comment.id == id
                  showed_comment.showed = true
                end
              end
              workflow_comment_show(comment, finished, true)
            end
       end
      " "
    else
        xm = Builder::XmlMarkup.new
      	xm << "<ul class='comment "
      	if workflow_comment.finished == true
      	  xm << "finished"
      	elsif workflow_comment.storno == true
      	  xm << "storno"
      	end
      	xm << "'>\n"
        if @current_user.id == workflow_comment.user_id 
      	  xm << "<li class='name mine'>\n"
      	elsif workflow_comment.created_at > Time.now - 12.hours	  
      	  xm << "<li class='name first_day'>\n"
      	elsif workflow_comment.created_at > Time.now - 1.day	  
      	  xm << "<li class='name second_day'>\n"
      	elsif workflow_comment.created_at > Time.now - 2.day	  
      	  xm << "<li class='name third_day'>\n"
      	elsif workflow_comment.created_at > Time.now - 3.day	  
      	  xm << "<li class='name forth_day'>\n"
        else
      	  xm << "<li class='name more_days'>\n"
      	end
      	  if !workflow_comment.user_id.blank?
      	     xm << " "+workflow_comment.user.fullname
      	  end
      	xm << ", "+my_time(workflow_comment.created_at)
      	xm << "<span class='odkazy'>"
      	if !(workflow_comment.finished == true || finished == true)
      	  xm << " "+right_show("workflow_comments", "new", link_to_remote("odpovědět", :url => { :action => "add_form", :id => workflow_comment.id}, :update =>  "comment_"+workflow_comment.id.to_s , :position => :bottom)).to_s
      	else 
      	  finished = true
      	end
      	xm << " "+ right_owner_link("workflow_comments", "edit", workflow_comment.user_id, 'upravit', edit_user_workflow_comment_url(@current_user.id, workflow_comment)).to_s
      	if workflow_comment.finished != true
      	  xm << " "+ right_link("workflow_comments", "finished", 'provedeno', finished_workflow_comment_path(workflow_comment)).to_s
      	end
      	if workflow_comment.storno != true
      	  xm << " "+ right_link("workflow_comments", "storno", 'neřešit', storno_workflow_comment_path(workflow_comment)).to_s
      	end
      	if workflow_comment.archiv != true
      	  xm << " "+ right_link("workflow_comments", "archiv", 'archivovat', archiv_workflow_comment_path(workflow_comment)).to_s
      	end
      	xm << "</span></li>\n"
      	xm << "<li class='text'>"+workflow_comment.note+"</li>\n"
        xm << "<div class='add_comment' id='comment_"+workflow_comment.id.to_s+"'></div>"
    
        if workflow_comment.workflow_comments.size > 0
            for comment in workflow_comment.workflow_comments.sort_by {|u| u.created_at}
              for showed_comment in @workflow_comments
                if showed_comment.id == comment.id
                  showed_comment.showed = true
                elsif showed_comment.id == id
                  showed_comment.showed = true
                end
              end
              xm << workflow_comment_show(comment, finished)
            end
        end  
        xm << "</ul>\n"
    
        xm
      end
    end
end
