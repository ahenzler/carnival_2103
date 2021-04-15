require './lib/ride'
require './lib/attendee'
require './lib/carnival'

RSpec.describe Carnival do
  context 'exists' do
    jeffco_fair = Carnival.new("Jefferson County Fair")

    it 'is a carnival' do
      expect(jeffco_fair).to be_instance_of(Carnival)
    end

    it 'has attributes' do
      expect(jeffco_fair.name).to eq('Jefferson County Fair')
      expect(jeffco_fair.rides).to eq([])
    end
  end

  context 'can modify rides' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})

    it 'can add rides' do
      jeffco_fair.add_ride(ferris_wheel)
      jeffco_fair.add_ride(bumper_cars)
      jeffco_fair.add_ride(scrambler)

      expected = [ferris_wheel, bumper_cars, scrambler]
      expect(jeffco_fair.rides).to eq(expected)
    end
  end

  context 'can reccomend rides for attendees based on iterests' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})
    bob = Attendee.new('Bob', 20)
    sally = Attendee.new('Sally', 20)

      it 'has recommended rides' do
        jeffco_fair.add_ride(ferris_wheel)
        jeffco_fair.add_ride(bumper_cars)
        jeffco_fair.add_ride(scrambler)
        bob.add_interest('Ferris Wheel')
        bob.add_interest('Bumper Cars')
        sally.add_interest('Scrambler')

        expected_b = [ferris_wheel, bumper_cars]
        expected_s = [scrambler]
        expect(jeffco_fair.recommend_rides(bob)).to eq(expected_b)
        expect(jeffco_fair.recommend_rides(sally)).to eq(expected_s)

    end
  end
end