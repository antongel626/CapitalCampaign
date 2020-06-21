class Api::V1::SessionsController < Api::V1::BaseController

  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    user = user_email.present? && User.find_by(email: user_email)

    if(user.present?)
      if user.valid_password? user_password
        sign_in user, store: false
        user.generate_authentication_token!
        user.save
        render json: Api::V1::UserSerializer.new(user).to_json, status: 200
      else
        render json: { errors: "Invalid password" }, status: 422
      end
    else
      render json: { errors: "Invalid email" }, status: 422
    end

  end

  def destroy
    user = User.find_by(auth_token: params[:id])
    user.generate_authentication_token!
    user.save
    head 204
  end

end
