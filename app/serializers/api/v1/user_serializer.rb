class Api::V1::UserSerializer < Api::V1::BaseSerializer
  attributes :id, :email, :name,  :score, :team_id, :is_lead, :auth_token

  # def serializable_has()
  # 	hash = super
  # 	hash.each { |key, value|
  #     if value.nil?
  #     	hash.delete(key)
  #     end
  # 	}
  # 	hash
  # end
  # has_many :microposts
  # has_many :following
  # has_many :followers

end
