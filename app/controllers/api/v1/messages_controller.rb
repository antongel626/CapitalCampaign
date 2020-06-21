class Api::V1::MessagesController < Api::V1::BaseController
  
  before_action :authenticate_with_token!, only: [:index, :show, :create, :update, :destroy]

  include ActiveHashRelation

  def index
    user_id = @current_user.id
    all_messages = Message.all
    messages = Array.new
    all_messages.each do |m|
      if m.from.include?("admin")
        if (m.to_users.nil? || m.to_users.empty?) && (m.to_teams.nil? || m.to_teams.empty?)
          messages<<m
        else
          if m.to_users.include?(user_id.to_s)
            messages<<m
          else
            if m.to_teams.include?(User.find(user_id).team_id.to_s)
              messages<<m
            end
          end
        end
      end
    end

    render(
      json: ActiveModel::Serializer::CollectionSerializer.new(
        messages,
        serializer: Api::V1::MessageSerializer,
        root: 'messages',
      )
    )
  end

  def show
    message = Message.find(params[:id])

    render(json: Api::V1::MessageSerializer.new(message).to_json)
  end

  def create
    submission = Submission.new
    message = Message.new
    message.content = message_params[:content]
    message.from = "user_" + @current_user.id.to_s
    message.to<<"admin"

    message.save

    render json: Api::V1::MessageSerializer.new(message).to_json, status: 200
  end

  def message_params
    # whitelist params
    params.require(:message).permit(:content)
  end

end