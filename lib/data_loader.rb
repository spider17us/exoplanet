require "json"


class DataLoader
  attr_accessor :data

  def initialize(filename)
    file = File.open filename
    @data = JSON.load file
  end
end
