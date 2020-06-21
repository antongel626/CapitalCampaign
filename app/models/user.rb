class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates_numericality_of :score, 
    :less_than_or_equal_to => 100, 
    :greater_than_or_equal_to => 0, 
    :only_integer => true
  validates :auth_token, uniqueness: true
  validate :check_team_lead

  before_create :generate_authentication_token!
  after_save :update_team

  def password_required?
    new_record? ? false : super
  end

  def update_team
  	
  	team = Team.find(team_id)

  	teamusers = User.where(:team_id => team_id)

  	sum = 0
  	teamusers.each do |u|
  	  sum += u.score
  	end

  	team.score = sum/teamusers.count
  	team.save
  end

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def team_name
    team = Team.find_by(id: team_id)
    str_team_name = "[Unknown Team]"
    if team.present?
      str_team_name = team.name
    end
    return str_team_name
  end

  def check_team_lead
    team_members = User.where(team_id: team_id)

    has_already_lead = false
    team_members.each do |member|
      if member.is_lead && member.id != id
        has_already_lead = true
      end
    end

    if has_already_lead && is_lead
      errors.add(:is_lead, "The team already has a leader")
    end
  end

end
