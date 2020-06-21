class Api::V1::TeamsController < Api::V1::BaseController
  
  before_action :authenticate_with_token!, only: [:index, :show, :update, :destroy]

  include ActiveHashRelation

  def index
    teams = Team.all

    teams = apply_filters(teams, params)
    
    render(
      json: ActiveModel::Serializer::CollectionSerializer.new(
        teams,
        serializer: Api::V1::TeamSerializer,
        root: 'teams',
      )
    )
  end

  def show
    team = Team.find(params[:id])

    render(json: Api::V1::TeamSerializer.new(team).to_json)
  end

end