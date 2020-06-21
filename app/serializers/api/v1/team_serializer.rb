class Api::V1::TeamSerializer < Api::V1::BaseSerializer
  attributes :id, :name,  :score, :goal_date

  def goal_date
    object.goal_date.in_time_zone.iso8601 if object.goal_date
  end
end
