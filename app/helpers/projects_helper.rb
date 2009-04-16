module ProjectsHelper
  def project_status(item)
    Project::STATUS_VALUES[item.status]
  end
  def work_status(item)
    Work::STATUS_VALUES[item.status]
  end
  def project_name(item)
     if item.project_id.blank?
        item.name
     else
        item.project.name + " - " + item.name 
     end
  end
  
  def filter_helper(filter , id , text)
    if !filter[id].blank?
    	text+": "+ check_box_tag('filter['+id+']', 'true', true)+"&nbsp;&nbsp;&nbsp";
    else
    	text+": "+check_box_tag('filter['+id+']', 'true')+"&nbsp;&nbsp;&nbsp";
  	end
  end
end
