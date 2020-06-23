require "test/unit"
require "json"
require "../lib/data_processor"

TEST_DATA_1_ORPHAN = [{"PlanetIdentifier"=>"KOI-1-ORPHAN", "TypeFlag"=>3, "PlanetaryMassJpt"=>"", "RadiusJpt"=>1.071, "PeriodDays"=>6.356006, "SemiMajorAxisAU"=>0.052, "Eccentricity"=>"", "PeriastronDeg"=>"", "LongitudeDeg"=>"", "AscendingNodeDeg"=>"", "InclinationDeg"=>88.24, "SurfaceTempK"=>"", "AgeGyr"=>"", "DiscoveryMethod"=>"transit", "DiscoveryYear"=>"", "LastUpdated"=>"", "RightAscension"=>"19 00 03.14", "Declination"=>"+40 13 14.7", "DistFromSunParsec"=>"", "HostStarMassSlrMass"=>0.46, "HostStarRadiusSlrRad"=>0.45, "HostStarMetallicity"=>0, "HostStarTempK"=>1000, "HostStarAgeGyr"=>""}]
TEST_DATA1_NO_ORPHAN = [{"PlanetIdentifier"=>"KOI-NO-ORPHAN", "TypeFlag"=>0, "PlanetaryMassJpt"=>"", "RadiusJpt"=>1.071, "PeriodDays"=>6.356006, "SemiMajorAxisAU"=>0.052, "Eccentricity"=>"", "PeriastronDeg"=>"", "LongitudeDeg"=>"", "AscendingNodeDeg"=>"", "InclinationDeg"=>88.24, "SurfaceTempK"=>"", "AgeGyr"=>"", "DiscoveryMethod"=>"transit", "DiscoveryYear"=>"", "LastUpdated"=>"", "RightAscension"=>"19 00 03.14", "Declination"=>"+40 13 14.7", "DistFromSunParsec"=>"", "HostStarMassSlrMass"=>0.46, "HostStarRadiusSlrRad"=>0.45, "HostStarMetallicity"=>0, "HostStarTempK"=>1000, "HostStarAgeGyr"=>""}]
TEST_DATA_2_ORPHAN = [{"PlanetIdentifier"=>"KOI-2-ORPHAN", "TypeFlag"=>3, "PlanetaryMassJpt"=>"", "RadiusJpt"=>1.071, "PeriodDays"=>6.356006, "SemiMajorAxisAU"=>0.052, "Eccentricity"=>"", "PeriastronDeg"=>"", "LongitudeDeg"=>"", "AscendingNodeDeg"=>"", "InclinationDeg"=>88.24, "SurfaceTempK"=>"", "AgeGyr"=>"", "DiscoveryMethod"=>"transit", "DiscoveryYear"=>"", "LastUpdated"=>"", "RightAscension"=>"19 00 03.14", "Declination"=>"+40 13 14.7", "DistFromSunParsec"=>"", "HostStarMassSlrMass"=>0.46, "HostStarRadiusSlrRad"=>0.45, "HostStarMetallicity"=>0, "HostStarTempK"=>1000, "HostStarAgeGyr"=>""},
{"PlanetIdentifier"=>"KOI-MED", "TypeFlag"=>3, "PlanetaryMassJpt"=>"", "RadiusJpt"=>1.071, "PeriodDays"=>6.356006, "SemiMajorAxisAU"=>0.052, "Eccentricity"=>"", "PeriastronDeg"=>"", "LongitudeDeg"=>"", "AscendingNodeDeg"=>"", "InclinationDeg"=>88.24, "SurfaceTempK"=>"", "AgeGyr"=>"", "DiscoveryMethod"=>"transit", "DiscoveryYear"=>"", "LastUpdated"=>"", "RightAscension"=>"19 00 03.14", "Declination"=>"+40 13 14.7", "DistFromSunParsec"=>"", "HostStarMassSlrMass"=>0.46, "HostStarRadiusSlrRad"=>0.45, "HostStarMetallicity"=>0, "HostStarTempK"=>1000, "HostStarAgeGyr"=>""}]
TEST_DATA_HOTTEST = [{"PlanetIdentifier"=>"KOI-HOTTEST", "TypeFlag"=>3, "PlanetaryMassJpt"=>"", "RadiusJpt"=>1.071, "PeriodDays"=>6.356006, "SemiMajorAxisAU"=>0.052, "Eccentricity"=>"", "PeriastronDeg"=>"", "LongitudeDeg"=>"", "AscendingNodeDeg"=>"", "InclinationDeg"=>88.24, "SurfaceTempK"=>"", "AgeGyr"=>"", "DiscoveryMethod"=>"transit", "DiscoveryYear"=>"", "LastUpdated"=>"", "RightAscension"=>"19 00 03.14", "Declination"=>"+40 13 14.7", "DistFromSunParsec"=>"", "HostStarMassSlrMass"=>0.46, "HostStarRadiusSlrRad"=>0.45, "HostStarMetallicity"=>0, "HostStarTempK"=>5000, "HostStarAgeGyr"=>""},
{"PlanetIdentifier"=>"KOI-MED", "TypeFlag"=>3, "PlanetaryMassJpt"=>"", "RadiusJpt"=>1.071, "PeriodDays"=>6.356006, "SemiMajorAxisAU"=>0.052, "Eccentricity"=>"", "PeriastronDeg"=>"", "LongitudeDeg"=>"", "AscendingNodeDeg"=>"", "InclinationDeg"=>88.24, "SurfaceTempK"=>"", "AgeGyr"=>"", "DiscoveryMethod"=>"transit", "DiscoveryYear"=>"", "LastUpdated"=>"", "RightAscension"=>"19 00 03.14", "Declination"=>"+40 13 14.7", "DistFromSunParsec"=>"", "HostStarMassSlrMass"=>0.46, "HostStarRadiusSlrRad"=>0.45, "HostStarMetallicity"=>0, "HostStarTempK"=>1000, "HostStarAgeGyr"=>""}]
TEST_DATA_HOTTEST_SAME = [{"PlanetIdentifier"=>"KOI-HOTTEST1", "TypeFlag"=>3, "PlanetaryMassJpt"=>"", "RadiusJpt"=>1.071, "PeriodDays"=>6.356006, "SemiMajorAxisAU"=>0.052, "Eccentricity"=>"", "PeriastronDeg"=>"", "LongitudeDeg"=>"", "AscendingNodeDeg"=>"", "InclinationDeg"=>88.24, "SurfaceTempK"=>"", "AgeGyr"=>"", "DiscoveryMethod"=>"transit", "DiscoveryYear"=>"", "LastUpdated"=>"", "RightAscension"=>"19 00 03.14", "Declination"=>"+40 13 14.7", "DistFromSunParsec"=>"", "HostStarMassSlrMass"=>0.46, "HostStarRadiusSlrRad"=>0.45, "HostStarMetallicity"=>0, "HostStarTempK"=>5000, "HostStarAgeGyr"=>""},
{"PlanetIdentifier"=>"KOI-HOTTEST2", "TypeFlag"=>3, "PlanetaryMassJpt"=>"", "RadiusJpt"=>1.071, "PeriodDays"=>6.356006, "SemiMajorAxisAU"=>0.052, "Eccentricity"=>"", "PeriastronDeg"=>"", "LongitudeDeg"=>"", "AscendingNodeDeg"=>"", "InclinationDeg"=>88.24, "SurfaceTempK"=>"", "AgeGyr"=>"", "DiscoveryMethod"=>"transit", "DiscoveryYear"=>"", "LastUpdated"=>"", "RightAscension"=>"19 00 03.14", "Declination"=>"+40 13 14.7", "DistFromSunParsec"=>"", "HostStarMassSlrMass"=>0.46, "HostStarRadiusSlrRad"=>0.45, "HostStarMetallicity"=>0, "HostStarTempK"=>1000, "HostStarAgeGyr"=>""}]
TEST_DATA_HOTTEST_NIL = [{"PlanetIdentifier"=>"KOI-NIL", "TypeFlag"=>3, "PlanetaryMassJpt"=>"", "RadiusJpt"=>1.071, "PeriodDays"=>6.356006, "SemiMajorAxisAU"=>0.052, "Eccentricity"=>"", "PeriastronDeg"=>"", "LongitudeDeg"=>"", "AscendingNodeDeg"=>"", "InclinationDeg"=>88.24, "SurfaceTempK"=>"", "AgeGyr"=>"", "DiscoveryMethod"=>"transit", "DiscoveryYear"=>"", "LastUpdated"=>"", "RightAscension"=>"19 00 03.14", "Declination"=>"+40 13 14.7", "DistFromSunParsec"=>"", "HostStarMassSlrMass"=>0.46, "HostStarRadiusSlrRad"=>0.45, "HostStarMetallicity"=>0, "HostStarTempK"=>"", "HostStarAgeGyr"=>""},
{"PlanetIdentifier"=>"KOI-HOTTEST", "TypeFlag"=>3, "PlanetaryMassJpt"=>"", "RadiusJpt"=>1.071, "PeriodDays"=>6.356006, "SemiMajorAxisAU"=>0.052, "Eccentricity"=>"", "PeriastronDeg"=>"", "LongitudeDeg"=>"", "AscendingNodeDeg"=>"", "InclinationDeg"=>88.24, "SurfaceTempK"=>"", "AgeGyr"=>"", "DiscoveryMethod"=>"transit", "DiscoveryYear"=>"", "LastUpdated"=>"", "RightAscension"=>"19 00 03.14", "Declination"=>"+40 13 14.7", "DistFromSunParsec"=>"", "HostStarMassSlrMass"=>0.46, "HostStarRadiusSlrRad"=>0.45, "HostStarMetallicity"=>0, "HostStarTempK"=>1000, "HostStarAgeGyr"=>""}]
TEST_DATA_TIMELINE = [{"PlanetIdentifier"=>"KOI-SMALL", "TypeFlag"=>3, "PlanetaryMassJpt"=>"", "RadiusJpt"=>0.071, "PeriodDays"=>6.356006, "SemiMajorAxisAU"=>0.052, "Eccentricity"=>"", "PeriastronDeg"=>"", "LongitudeDeg"=>"", "AscendingNodeDeg"=>"", "InclinationDeg"=>88.24, "SurfaceTempK"=>"", "AgeGyr"=>"", "DiscoveryMethod"=>"transit", "DiscoveryYear"=>2020, "LastUpdated"=>"", "RightAscension"=>"19 00 03.14", "Declination"=>"+40 13 14.7", "DistFromSunParsec"=>"", "HostStarMassSlrMass"=>0.46, "HostStarRadiusSlrRad"=>0.45, "HostStarMetallicity"=>0, "HostStarTempK"=>"", "HostStarAgeGyr"=>""},
{"PlanetIdentifier"=>"KOI-MEDIUM", "TypeFlag"=>3, "PlanetaryMassJpt"=>"", "RadiusJpt"=>1.071, "PeriodDays"=>6.356006, "SemiMajorAxisAU"=>0.052, "Eccentricity"=>"", "PeriastronDeg"=>"", "LongitudeDeg"=>"", "AscendingNodeDeg"=>"", "InclinationDeg"=>88.24, "SurfaceTempK"=>"", "AgeGyr"=>"", "DiscoveryMethod"=>"transit", "DiscoveryYear"=>2020, "LastUpdated"=>"", "RightAscension"=>"19 00 03.14", "Declination"=>"+40 13 14.7", "DistFromSunParsec"=>"", "HostStarMassSlrMass"=>0.46, "HostStarRadiusSlrRad"=>0.45, "HostStarMetallicity"=>0, "HostStarTempK"=>1000, "HostStarAgeGyr"=>""},
{"PlanetIdentifier"=>"KOI-LARGE", "TypeFlag"=>3, "PlanetaryMassJpt"=>"", "RadiusJpt"=>2.071, "PeriodDays"=>6.356006, "SemiMajorAxisAU"=>0.052, "Eccentricity"=>"", "PeriastronDeg"=>"", "LongitudeDeg"=>"", "AscendingNodeDeg"=>"", "InclinationDeg"=>88.24, "SurfaceTempK"=>"", "AgeGyr"=>"", "DiscoveryMethod"=>"transit", "DiscoveryYear"=>2020, "LastUpdated"=>"", "RightAscension"=>"19 00 03.14", "Declination"=>"+40 13 14.7", "DistFromSunParsec"=>"", "HostStarMassSlrMass"=>0.46, "HostStarRadiusSlrRad"=>0.45, "HostStarMetallicity"=>0, "HostStarTempK"=>1000, "HostStarAgeGyr"=>""}]


class DataProcessorTest < Test::Unit::TestCase
  def test_get_num_orphaned_planets
    processor = DataProcessor.new(TEST_DATA_1_ORPHAN)
    assert_equal 1, processor.get_num_orphaned_planets, "Should have loaded 1 planets."

    processor = DataProcessor.new(TEST_DATA1_NO_ORPHAN)
    assert_equal 0, processor.get_num_orphaned_planets, "Should have loaded 0 planets."

    processor = DataProcessor.new(TEST_DATA_2_ORPHAN)
    assert_equal 2, processor.get_num_orphaned_planets, "Should have loaded 2 planets."
  end

  def test_get_planet_orbit_hottest_star
    processor = DataProcessor.new(TEST_DATA_HOTTEST)
    assert_equal "KOI-HOTTEST", processor.get_planet_orbit_hottest_star, "Should be KOI-HOTTEST"

    processor = DataProcessor.new(TEST_DATA_HOTTEST_SAME)
    assert_equal "KOI-HOTTEST1", processor.get_planet_orbit_hottest_star, "Should be KOI-HOTTEST1."

    processor = DataProcessor.new(TEST_DATA_HOTTEST_NIL)
    assert_equal "KOI-HOTTEST", processor.get_planet_orbit_hottest_star, "Should be KOI-HOTTEST."
  end

  def test_get_timeline
    processor = DataProcessor.new(TEST_DATA_TIMELINE)
    assert_equal 1, processor.get_timeline.size, "Should be 1 item for 2020"
    assert_equal 2020, processor.get_timeline[0][0], "Should 2020 for the year"
    assert_equal 1, processor.get_timeline[0][1]["small"], "Should be 1 small"
    assert_equal 1, processor.get_timeline[0][1]["medium"], "Should be 1 med"
    assert_equal 1, processor.get_timeline[0][1]["large"], "Should be 1 large"
  end
end
