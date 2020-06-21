class Submission < ApplicationRecord
  
  def submitted_by_name
  	user = submitted_by.present? && User.find_by(id: submitted_by)
    if user.present?
      submitted_by_name = user.name
    else
      submitted_by_name = "[Unknown User]"
    end
    return submitted_by_name
  end

end
