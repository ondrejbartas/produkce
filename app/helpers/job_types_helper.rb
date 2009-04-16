module JobTypesHelper

  def day_names(item)
    JobType::DAY_NAMES[item]
  end
end
