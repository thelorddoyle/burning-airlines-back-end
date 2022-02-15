require 'colorize'

print "Creating seed airplanes...".green

Airplane.destroy_all

plane_names = ['Boeing 787', 'Airbus A380', 'Douglas DC-3', 'Boeing 737', 'Concorde', 'De Havilland Comet']

# The reason you need this array is because we need to give the flights IDs, and because we are randomising these airplanes we just need to store their IDs in an array so we can assign them in flights and other seeds
airplane_array = []

3.times do |i|

  randomPlane = 'airplane'+(i+1).to_s
  randomPlane = Airplane.create!

  randomPlane.name = plane_names.sample
  randomPlane.rows = 10
  randomPlane.columns = 4
  randomPlane.save

  airplane_array.push randomPlane.id
end

puts "Success! #{ Airplane.count } random airplanes created.".green

print "Creating seed flights...".blue

Flight.destroy_all

origins = ['Sydney', 'Melbourne', 'Brisbane', 'Perth', 'Canberra']
destinations = ['Washington DC', 'Birmingham', 'Paris', 'Berlin', 'Beirut']
flight_array = []

5.times do |i|
  
  randomFlight = 'flight'+(i+1).to_s
  randomFlight = Flight.create!

  randomFlight.seats = 40
  randomFlight.origin = origins.sample
  randomFlight.destination = destinations.sample
  randomFlight.airplane_id = airplane_array.sample
  randomFlight.save

  flight_array.push randomFlight.id

end

puts "Success! #{ Flight.count } random flights created.".blue

print "Creating seed users...".green
User.destroy_all

user1 = User.create! name: 'admin', is_admin: true

puts "#{ User.count } users created.".green

print "Creating seed reservations...".blue

Reservation.destroy_all

reservation_array = []

10.times do |i|

  randomReservation = 'reservation'+(i+1).to_s
  randomReservation = Reservation.create!

  randomReservation.row = rand(1..10)
  randomReservation.column = rand(1..4)
  randomReservation.flight_id = flight_array.sample
  randomReservation.user_id = user1.id

  randomReservation.save

  reservation_array.push randomReservation

end

puts "#{ Reservation.count } reservations created.".blue

# This is just checking that no reservation has the same row on the same flight (we can improve this) but we don't want duplicate reservations.

answer = reservation_array.uniq { |res| [res.flight_id, res.row] }
if reservation_array.count == answer.count
  puts "All reservation are unique.".blue
end