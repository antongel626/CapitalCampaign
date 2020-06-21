class Message < ApplicationRecord
	serialize :to, Array
	serialize :to_users, Array
	serialize :to_teams, Array

	def string_for_to 
  	# Make string for Admins
  	str_admin = ""
  	if !to.nil? && !to.empty?
  		str_admin = "HQ"
  	end

    # Make string for users
    str_users = ""
    if !to_users.nil? && !to_users.empty?
    	str_users = "Members : "
    end
    to_users.each do |uid|
    	user = User.find_by(id: number_or_nil(uid))
    	if user.present?
    		str_users = str_users + user.name + ","
    	else
    		str_users = str_users + "[Unknown User],"
    	end
    end
    if str_users.length > 0
    	str_users.chop!
    end

    # Make string for teams
    str_teams = ""
    if !to_teams.nil? && !to_teams.empty?
    	str_teams = "Teams : "
    end
    to_teams.each do |tid|
    	team = Team.find_by(id: number_or_nil(tid))
    	if team.present?
    		str_teams = str_teams + team.name + ","
    	else
    		str_teams = str_teams + "[Unknown Team],"
    	end
    end
    if str_teams.length > 0
    	str_teams.chop!
    end

    str_to_show = ""
    if str_teams.length == 0 && str_users.length == 0 && str_admin.length == 0
    	if from.include?("admin")
    		str_to_show = "TO ALL"
    	end
    else
    	str_to_show = str_admin + "\n" + str_users + "\n" + str_teams
    end

    return str_to_show
  end

  def string_for_from
  	str_to_show = from
    if str_to_show.include?("user_")
      uid = str_to_show.sub!("user_", "")
      user = User.find_by(id: number_or_nil(uid))
      if user.present?
      	str_to_show = user.name
      else
      	str_to_show = "[Unknown User]"
      end
    elsif str_to_show.include?("admin")
      str_to_show = "HQ"
    else
    	str_to_show = ""
    end

    return str_to_show
  end

  def number_or_nil(string)
    num = string.to_i
    num if num.to_s == string
  end
end
