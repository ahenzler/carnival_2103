class Carnival
  attr_reader :name,
              :rides

  def initialize(name)
    @name = name
    @rides = []
  end

  def add_ride(ride)
    @rides << ride
  end

  def recommend_rides(attendee)
    attendee.interests.flat_map do |interest|
      @rides.find do |ride|
        ride.name == interest
      end
    end
  end
end