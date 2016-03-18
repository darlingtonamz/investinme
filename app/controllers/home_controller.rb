class HomeController < ApplicationController
  def index
  	@campaigns = Campaign.all
  	@user = User.find(1)
  end
end
