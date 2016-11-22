class UserBrowserController < ApplicationController
  def index
    @users = User.all
  end
end
