class BloodGlucoseLevelPresenter < BasePresenter
  presents :record

  def level
  	record.level
  end

  def date_time
  	unless record.checked_at.blank?
  		record.checked_at.strftime("%d %b %Y %I:%M%p") 
  	else
  		record.updated_at.strftime("%d %b %Y %I:%M%p") 
  	end
  end
end