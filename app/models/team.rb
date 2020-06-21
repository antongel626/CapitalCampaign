class Team < ApplicationRecord
	def team_leader_name
		team_members = User.where(team_id: id, is_lead: true)
		leader_name = "[No Leader]"
		if team_members.present?
			leader_name = team_members.first.name
		end
		return leader_name
	end
end
