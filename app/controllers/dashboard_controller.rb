class DashboardController < ApplicationController
  def index
    @username = current_user ? current_user.uid : nil
    @user_id = current_user ? current_user.id : nil
  end
end
