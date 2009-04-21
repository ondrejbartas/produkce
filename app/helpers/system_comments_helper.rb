module SystemCommentsHelper


  def system_comment_show(system_comment, finished)
    xm = Builder::XmlMarkup.new
  	xm << "<ul class='comment "
  	if system_comment.finished == true
  	  xm << "finished"
  	end
  	xm << "'>\n"
  	xm << "<li class='name'>\n"
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
  	xm << " "+ right_link("system_comments", "edit", 'Edit', edit_system_comment_path(system_comment)).to_s
  	if system_comment.finished != true
  	  xm << " "+ right_link("system_comments", "finished", 'provedeno', finished_system_comment_path(system_comment)).to_s
  	end
  	xm << "</span></li>\n"
  	xm << "<li class='text'>"+system_comment.note+"</li>\n"
    xm << "<div class='add_comment' id='comment_"+system_comment.id.to_s+"'></div>"
    
    if system_comment.system_comments.size > 0
        for comment in system_comment.system_comments.sort_by {|u| u.created_at}
          xm << system_comment_show(comment, finished)
        end
    end  
    xm << "</ul>\n"
    
    xm
  end
end
