class Api::V1::UsersController < Api::V1::BaseController
  
  before_action :authenticate_with_token!, only: [:index, :show, :update, :destroy]
  # respond_to :json

  include ActiveHashRelation

  def index
    users = User.all

    users = apply_filters(users, params)
    
    render(
      json: ActiveModel::Serializer::CollectionSerializer.new(
        users,
        serializer: Api::V1::UserSerializer,
        root: 'users',
      )
    )
  end

  def show
    user = User.find(params[:id])

    render(json: Api::V1::UserSerializer.new(user).to_json)
  end

  # def update
  #   user = current_user

  #   if user.update(user_params)
  #     render json: user, status: 200, location: [:api, user]
  #   else
  #     render json: { errors: user.errors }, status: 422
  #   end
  # end

  # def destroy
  #   current_user.destroy
  #   head 204
  # end

end