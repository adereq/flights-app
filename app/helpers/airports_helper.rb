module AirportsHelper
  def maps_generator
	@url = "https://www.google.com/maps/embed/v1/place?key=AIzaSyBTOrtuLE80_u0yqeE2KQnzzd7atabZ34M&q=#{@airport.name}&zoom=10"
  end
end
