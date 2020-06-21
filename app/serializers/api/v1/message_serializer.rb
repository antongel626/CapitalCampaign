class Api::V1::MessageSerializer < Api::V1::BaseSerializer
  attributes :from, :content, :updated_at, :to_users, :to_teams
end
