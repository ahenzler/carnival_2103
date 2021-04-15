class Carnival
  attr_reader :name,
              :rides,
              :attendees

  def initialize(name)
    @name = name
    @rides = []
    @attendees = []
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

  def admit(attendee)
    @attendees << attendee
  end

  def attendees_by_ride_interest
    attendees_hash = Hash.new do |hash, key|
      hash[key] = []
    end
     @rides.flat_map do |ride|
      attendees_hash[ride]
      @attendees.find_all do |attendee|
        if attendee.interests.include?(ride.name)
          attendees_hash[ride] << attendee
        end
      end
    end
    attendees_hash
  end


end