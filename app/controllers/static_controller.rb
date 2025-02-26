class StaticController < ApplicationController
  def privacy_policy
  end

  def members
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "Log in before accessing the members page."
      return
    end

    @users = User.all # get all users
  end
end
