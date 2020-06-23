class DataProcessor

  def initialize(data)
    @num_orphaned_planets = 0
    @planet_orbit_hottest_star = {planet: "", temp: 0 }
    @timeline = {}

    calculate(data)
  end

  def get_num_orphaned_planets
    return @num_orphaned_planets
  end

  def get_planet_orbit_hottest_star
    return @planet_orbit_hottest_star[:planet]
  end

  def print_timeline
    get_timeline.each { | year |
      puts "In #{year[0]}, we discovered #{year[1]["small"]} small planet#{year[1]["small"] == 1 ? '' : 's'}, #{year[1]["medium"]} medium planet#{year[1]["medium"] == 1 ? '' : 's'}, and #{year[1]["large"]} large planet#{year[1]["large"] == 1 ? '' : 's'}."
    }
  end

  def get_timeline
    return @timeline.sort
  end

  private

  def find_orphaned_planets(planet)
    # Find Number of Orphaned Planets
    if planet["TypeFlag"] == 3
      @num_orphaned_planets += 1
    end
  end

  def find_planet_orbiting_hottest_star(planet)
    # Find Planet Orbiting Hottest HostStar
    # Assume if equal temperature, use the first one found.
    if planet["HostStarTempK"].to_i > @planet_orbit_hottest_star[:temp]
      @planet_orbit_hottest_star[:planet] = planet["PlanetIdentifier"]
      @planet_orbit_hottest_star[:temp] = planet["HostStarTempK"]
    end
  end

  def build_timeline(planet)
    # Build timeline grouped by size
    year = planet["DiscoveryYear"]
    # Ignore year if empty
    unless year.to_s.empty?
      # Get Radii Info from Hash
      radii = @timeline[planet["DiscoveryYear"]]

      if radii.nil?
        # New timeline item if no information exists in hash
        if planet["RadiusJpt"].to_s.empty?
          # Ignore if not a valid radius
        elsif planet["RadiusJpt"].to_f < 1.0
          @timeline[planet["DiscoveryYear"]] = {"small" => 1, "medium" => 0, "large" => 0 }
        elsif planet["RadiusJpt"].to_f < 2.0
          @timeline[planet["DiscoveryYear"]] = {"small" => 0, "medium" => 1, "large" => 0 }
        else
          @timeline[planet["DiscoveryYear"]] = {"small" => 0, "medium" => 0, "large" => 1 }
        end
      else
        # Value exists in hash, updates values
        if planet["RadiusJpt"].to_s.empty?
          # Ignore if not a valid radius
        elsif planet["RadiusJpt"].to_f < 1.0
          radii["small"] += 1
        elsif planet["RadiusJpt"].to_f < 2.0
          radii["medium"] += 1
        else
          radii["large"] += 1
        end
        @timeline[planet["DiscoveryYear"]] = radii
      end
    end
  end

  def calculate(data)
    data.each { | planet |
      find_orphaned_planets(planet)
      find_planet_orbiting_hottest_star(planet)
      build_timeline(planet)
    }
  end
end
