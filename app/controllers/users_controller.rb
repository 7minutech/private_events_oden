class UsersController < ApplicationController
  def show
    @user = current_user
    @events = @user.created_events
  end
end
