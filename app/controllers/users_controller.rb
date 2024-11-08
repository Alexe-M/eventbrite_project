class UsersController < ApplicationController

  def show
    @user = current_user
    @events = @user.events_administered
  end


end
local_variables