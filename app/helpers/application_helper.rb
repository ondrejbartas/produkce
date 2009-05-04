# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def store_location
     session['saved_location'] = request.request_uri
  end


# Format a label element for a form field.
#
# +options+ can include:
#
# [:required] If +true+, an asterisk is added to the label.
# [:field_name] If true, the for attribute on the label
# is set from +model+ + +field_name+;
# otherwise, for attribute is set from
# +model+ + lowercased and underscored +label_text+.
#
# Example call:
# label(:person, 'Email')
#
# Example output:
# <strong><label for="person_email">Email</label>:</strong>
def label(model, field_name, label_text, options={})
  # Use the field_name option if supplied
  # The value for the for attribute.
  label_for = (model.to_s + '_' + field_name).downcase
  # The <label> tag
  label_tag = content_tag('label', label_text, :for => label_for)
  # Add an asterisk if :required option specified.
  label_tag += '*' if options[:required]
  # Finish off the label.
  label_tag += ':'
  # Wrap the <label> tag in a <strong> tag.
  content_tag('strong', label_tag)
end
def print_mail_into_cell(value)
  #Print field if is not blank
  unless value.blank?
    out = "<i>mail: </i>"+mail_to(value)+'<br />'
  else
    out = ""
  end
  out
end
def print_into_cell(value,text)
  #Print field if is not blank
  unless value.blank?
    out = "<i>"+text+": </i>"+value+'<br />'
  else
    out = ""
  end
  out
end
def print_address_into_cell(value)
  #Print field if is not blank
  unless value.blank?
    out = address_format(value)
  else
    out = ""
  end
  out
end

def print_mail_cell(value)
  #Print field if is not blank
  unless value.blank?
    out = '<td>'+mail_to(value)+'</td>'
  else
    out = ""
  end
  out
end
def print_cell(value)
  #Print field if is not blank
  unless value.blank?
    out = '<td>'+value+'</td>'
  else
    out = "<td></td>"
  end
  out
end
def print_address_cell(value)
  #Print field if is not blank
  unless value.blank?
    out = '<td>'+address_format(value)+'</td>'
  else
    out = "<td></td>"
  end
  out
end

def print_field(value, text, warp)
  #Print field if is not blank
  unless value.blank?
    out = '<'+warp+'><strong>'+text+'</strong> '+value+'</'+warp+'>'
  else
    out = ""
  end
  out
end
def print_address_field(value, text, warp)
  #Print field if is not blank
  unless value.blank?
    out = '<'+warp+'><strong>'+text+'</strong> '+address_format(value)+'</'+warp+'>'
  else
    out = ""
  end
  out
end

def print_simple_field(value, text, warp)
  #Print field if is not blank
  unless value.blank?
    out = '<'+warp+'><strong>'+text+'</strong> '+simple_format(value)+'</'+warp+'>'
  else
    out = ""
  end
  out
end

def print_mail_field(value, text, warp)
  #Print field if is not blank
  unless value.blank?
    out = '<'+warp+'><strong>'+text+'</strong> '+mail_to(value)+'</'+warp+'>'
  else
    out = ""
  end
  out
end

def show_name(item)
    item.nil? ? "" : item.name
end

 def address_format(text)
    content_tag 'address', text.to_s.
      gsub(/\r\n?/, "\n").                    # \r\n and \r -> \n
      gsub(/\n\n+/, "</address>\n\n<address>").           # 2+ newline  -> paragraph
      gsub(/([^\n]\n)(?=[^\n])/, '\1<br />')  # 1 newline   -> br
 end

 def main_menu(activePage, value, text)
    
    rights = Right.find(:all, :conditions => [" controller = 'account' AND action = ? ", value])
   
    if rights.size > 0
      if rights.first.check?(@current_user, 0 )
         if @activePage == value
                out = '<span class="active">'
         else
                out = '<span class="inactive">'
         end
         out+'<a href="/'+value+'">'+text+'</a></span>'
      end
    else
       if @activePage == value
              out = '<span class="active">'
       else
              out = '<span class="inactive">'
       end
       out+'<a href="/'+value+'">'+text+'</a></span>'
    end
 end


 def sub_menu(controller, action, text, path)

     rights = Right.find(:all, :conditions => [" controller = ? AND action = ? ", controller, action])

     if rights.size > 0
       if rights.first.check?(@current_user, 0 )
          link_to text, path
       end
     else
        link_to text, path
     end
  end

 def right_link (controller, action, text, path)

       rights = Right.find(:all, :conditions => [" controller = ? AND action = ? ", controller, action])

       if rights.size > 0
         if rights.first.check?(@current_user, 0 )
            link_to text, path
         end
       end
 end
 
 def right_owner_link (controller, action, user_id, text, path)

        rights = Right.find(:all, :conditions => [" controller = ? AND action = ? ", controller, action])

        if rights.size > 0
          if rights.first.check?(@current_user, user_id )
             link_to text, path
          end
        end
  end
 
 def right_show_link (controller, action, text, path)

        rights = Right.find(:all, :conditions => [" controller = ? AND action = ? ", controller, action])

        if rights.size > 0
          if rights.first.check?(@current_user, 0 )
             link_to text, path
          else 
             text
          end
        else 
          text
        end
  end

 def right_delete_link (controller, action, text, path)

       rights = Right.find(:all, :conditions => [" controller = ? AND action = ? ", controller, action])

       if rights.size > 0
         if rights.first.check?(@current_user, 0 )
            link_to text, path, :confirm => 'Jste si opravdu jisti ke smazani ', :method => :delete
         end      
       end
 end
 
 
 def right_show (controller, action, text)

         rights = Right.find(:all, :conditions => [" controller = ? AND action = ? ", controller, action])
         if rights.size > 0
           if rights.first.check?(@current_user, 0 )
              text
           end
         end
 end
 
 def right_show_sub (controller, action, sub, text)

          rights = Right.find(:all, :conditions => [" controller = ? AND action = ? AND sub = ?", controller, action, sub])
          if rights.size > 0
            if rights.first.check?(@current_user, 0 )
               text
            end
          end
  end
 
 


 def my_hour(item)
    item.strftime('%H:%M')
 end

 def my_time(item)
    item.strftime('%H:%M %d.%m.%Y')
 end

  def my_date(item)
    item.strftime('%d.%m.%Y')
 end
 
 def shorten (string, count = 30)
 	if string.length >= count 
 		shortened = string[0, count]
 		splitted = shortened.split(/\s/)
 		words = splitted.length
 		splitted[0, words-1].join(" ") + ' ...'
 	else 
 		string
 	end
 end


 def show_name item
   if !item.blank? && !item.name.blank?
     item.name
   else 
     ""
   end
 end
 
 def legend
   "		Legenda: 
				<div  class='calendar_event'>
				    <div class='reserved' style='width:90px'>
					  	 <div class='top'></div>
						 <div class='body'>rezervováno</div>
						 <div class='bottom'></div>
					 </div>
				</div>
				<div  class='calendar_event'>
				 	 <div class='nooperations' style='width:90px'>
					  	 <div class='top'></div>
						 <div class='body'>neprovedeno</div>
						 <div class='bottom'></div>
					 </div>
				</div>
				<div  class='calendar_event'>
					 <div class='unfinished' style='width:90px'>
					  	 <div class='top'></div>
						 <div class='body'>neukončeno</div>
						 <div class='bottom'></div>
					 </div>
				</div>
				<div class='calendar_event'>
				 	 <div class='finished' style='width:90px'>
					  	 <div class='top'></div>
						 <div class='body'>ukončeno</div>
						 <div class='bottom'></div>
					 </div>
				</div>
			"
 end
 
 def legend_project
    "		Legenda: 
 				<div  class='calendar_event'>
 				    <div class='reserved' style='width:90px'>
 					  	 <div class='top'></div>
 						 <div class='body'>rezervace</div>
 						 <div class='bottom'></div>
 					 </div>
 				</div>
 				<div  class='calendar_event'>
 				 	 <div class='nooperations' style='width:90px'>
 					  	 <div class='top'></div>
 						 <div class='body'>neprovedená práce</div>
 						 <div class='bottom'></div>
 					 </div>
 				</div>
 				<div  class='calendar_event'>
 					 <div class='unfinished' style='width:90px'>
 					  	 <div class='top'></div>
 						 <div class='body'>neukončený</div>
 						 <div class='bottom'></div>
 					 </div>
 				</div>
 				<div class='calendar_event'>
 				 	 <div class='finished' style='width:90px'>
 					  	 <div class='top'></div>
 						 <div class='body'>všechny práce hotové</div>
 						 <div class='bottom'></div>
 					 </div>
 				</div>
 			"
  end
  
  
  
  
  def sort_td_class_helper(param)
    result = 'class="sort"'
    result = 'class="sortup"' if params[:sort] == param
    result = 'class="sortdown"' if params[:sort] == param + "_reverse"
    return result
  end
  
  def sort_link_helper(text, param)
    key = param
    key += "_reverse" if params[:sort] == param
    options = {
        :url => {:action => 'list', :params => params.merge({:sort => key, :page => nil})},
        :update => 'table',
        :before => "Element.show('spinner')",
        :success => "Element.hide('spinner')"
    }
    html_options = {
      :title => "Sort by this field",
      :href => url_for(:action => 'list', :params => params.merge({:sort => key, :page => nil}))
    }
    link_to_remote(text, options, html_options)
  end
  
end
