class Ride
  attr_reader :name,
              :cost

  def initialize(ride_info)
    @name = ride_info[:name]
    @cost = ride_info[:cost]
  end
end