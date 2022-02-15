require 'colorize'

print "Creating seed airplanes...".green

Airplane.destroy_all

plane_names = ['Boeing 787', 'Airbus A380', 'Douglas DC-3', 'Boeing 737', 'Concorde', 'De Havilland Comet']
plane_column_options = [2,4,6]

5.times do |i|

  randomPlane = 'airplane'+(i+1).to_s

  randomPlane = Airplane.create!
  randomPlane.name = plane_names.sample
  randomPlane.rows = rand(10..15)
  randomPlane.columns = plane_column_options.sample

  randomPlane.save

end

puts "Success! #{ Airplane.count } random airplanes created.".green