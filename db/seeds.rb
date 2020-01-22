tab = ["01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]

tab.each do |x|
Flight.create(departure_airport_id:2, arrival_airport_id:1, departure_date:
"2020-03-#{x}", departure_time:"09:10:00", arrival_time: "10:05:00",
flight_number: "A209",airplane_id:2, economy_seats: 120, business_seats:2,
economy_free_seats:120, business_free_seats: 2, economy_price:"79.0",
business_price:"319.0")
Flight.create(departure_airport_id:3, arrival_airport_id:4, departure_date:
"2020-03-#{x}", departure_time:"10:30:00", arrival_time: "11:45:00",
flight_number: "A333",airplane_id:2, economy_seats: 120, business_seats:2,
economy_free_seats:120, business_free_seats: 2, economy_price:"179.0",
business_price:"449.0")
Flight.create(departure_airport_id:5, arrival_airport_id:1, departure_date:
"2020-03-#{x}", departure_time:"17:10:00", arrival_time: "18:05:00",
flight_number: "A209",airplane_id:2, economy_seats: 120, business_seats:2,
economy_free_seats:120, business_free_seats: 2, economy_price:"79.0",
business_price:"319.0")
Flight.create(departure_airport_id:2, arrival_airport_id:1, departure_date:
"2020-03-#{x}", departure_time:"20:10:00", arrival_time: "21:05:00",
flight_number: "A209",airplane_id:2, economy_seats: 120, business_seats:2,
economy_free_seats:120, business_free_seats: 2, economy_price:"109.0",
business_price:"399.0")
end