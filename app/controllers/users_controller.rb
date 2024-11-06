class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @events = @user.events_administered
  end


end
