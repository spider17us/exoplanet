require "./lib/data_loader.rb"
require "./lib/data_processor.rb"

loader = DataLoader.new("./data/exoplanets.json")
processor = DataProcessor.new(loader.data)

puts "Number of Orphaned Planets: #{processor.get_num_orphaned_planets}"
puts "Planet Orbiting Hottest Star: #{processor.get_planet_orbit_hottest_star}"
processor.print_timeline
