class UsersController < ApplicationController
  before_action :require_login

  def show
    @user = current_user
    @events = @user.created_events
    redirect_to user_path(@user), alert: "Access denied" if @user.id != params[:id].to_i
  end

  private

  def require_login
    redirect_to new_user_session_path if !user_signed_in?
  end
end
