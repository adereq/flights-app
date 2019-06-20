class UserPagesController < ApplicationController
  def index
  	@flights = Flight.search_flights(2,3)
  end
end