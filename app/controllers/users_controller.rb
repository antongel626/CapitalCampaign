class UsersController < ApplicationController

  private

  def user_params
    params.require(:user).permit(:name, :email, :score, :team_id, :is_lead)
  end

end
