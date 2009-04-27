module SystemCommentsHelper


  def system_comment_show(id, finished, archiv = false)
    system_comment = SystemComment.find(id)
    
    if system_comment.archiv == true || archiv == true
       if system_comment.system_comments.size > 0
            for comment in system_comment.system_comments.sort_by {|u| u.created_at}
              for showed_comment in @system_comments
                if showed_comment.id == comment.id
                  showed_comment.showed = true
                elsif showed_comment.id == id
                  showed_comment.showed = true
                end
              end
           system_comment_show(comment, finished, true)
        end
        " "
    else
        xm = Builder::XmlMarkup.new
      	xm << "<ul class='comment "
      	if system_comment.finished == true
      	  xm << "finished"
      	elsif system_comment.storno == true
      	  xm << "storno"
      	end
      	xm << "'>\n"
        if @current_user.id == system_comment.user_id 
      	  xm << "<li class='name mine'>\n"
      	elsif system_comment.created_at > Time.now - 12.hours	  
      	  xm << "<li class='name first_day'>\n"
      	elsif system_comment.created_at > Time.now - 1.day	  
      	  xm << "<li class='name second_day'>\n"
      	elsif system_comment.created_at > Time.now - 2.day	  
      	  xm << "<li class='name third_day'>\n"
      	elsif system_comment.created_at > Time.now - 3.day	  
      	  xm << "<li class='name forth_day'>\n"
        else
      	  xm << "<li class='name more_days'>\n"
      	end
      	  if !system_comment.user_id.blank?
      	     xm << " "+system_comment.user.fullname
      	  end
      	xm << ", "+my_time(system_comment.created_at)
      	xm << "<span class='odkazy'>"
      	if !(system_comment.finished == true || finished == true)
      	  xm << " "+right_show ("system_comments", "new", link_to_remote("odpovědět", :url => { :action => "add_form", :id => system_comment.id}, :update =>  "comment_"+system_comment.id.to_s , :position => :bottom)).to_s
      	else 
      	  finished = true
      	end
      	xm << " "+ right_owner_link("system_comments", "edit", system_comment.user_id, 'upravit', edit_user_system_comment_url(@current_user.id, system_comment)).to_s
      	if system_comment.finished != true
      	  xm << " "+ right_link("system_comments", "finished", 'provedeno', finished_system_comment_path(system_comment)).to_s
      	end
      	if system_comment.storno != true
      	  xm << " "+ right_link("system_comments", "storno", 'neřešit', storno_system_comment_path(system_comment)).to_s
      	end
      	if system_comment.archiv != true
      	  xm << " "+ right_link("system_comments", "archiv", 'archivovat', archiv_system_comment_path(system_comment)).to_s
      	end
      	xm << "</span></li>\n"
      	xm << "<li class='text'>"+system_comment.note+"</li>\n"
        xm << "<div class='add_comment' id='comment_"+system_comment.id.to_s+"'></div>"
    
        if system_comment.system_comments.size > 0
            for comment in system_comment.system_comments.sort_by {|u| u.created_at}
              for showed_comment in @system_comments
                if showed_comment.id == comment.id
                  showed_comment.showed = true
                elsif showed_comment.id == id
                  showed_comment.showed = true
                end
              end
              xm << system_comment_show(comment, finished)
            end
        end  
        xm << "</ul>\n"
    
        xm
      end
    end
end
