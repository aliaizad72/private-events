class UsersController < ApplicationController
  before_action :require_own_account, only: :show
  def show
     @user = User.find_by(id: params[:id])
  end

  private

  def require_own_account
    unless current_user.id == params[:id]
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_session_path
    end
  end
end
