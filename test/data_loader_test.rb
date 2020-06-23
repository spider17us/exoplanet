require "test/unit"
require "../lib/data_loader"


class DataLoaderTest < Test::Unit::TestCase
  def test_init_load
    loader = DataLoader.new("../test/data/test.json")
    assert_equal 4, loader.data.size, "Should have loaded 3 planets."
    puts loader.data
  end
end
