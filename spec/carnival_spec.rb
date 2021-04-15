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
      expect(jeffco_fair.attendees).to eq([])
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

  context 'interested attendees' do
    jeffco_fair = Carnival.new("Jefferson County Fair")
    ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
    bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
    scrambler = Ride.new({name: 'Scrambler', cost: 15})
    jeffco_fair.add_ride(ferris_wheel)
    jeffco_fair.add_ride(bumper_cars)
    jeffco_fair.add_ride(scrambler)
    jeffco_fair.attendees
    bob = Attendee.new("Bob", 0)
    bob.add_interest('Ferris Wheel')
    bob.add_interest('Bumper Cars')
    sally = Attendee.new('Sally', 20)
    sally.add_interest('Bumper Cars')
    johnny = Attendee.new("Johnny", 5)
    johnny.add_interest('Bumper Cars')

    it 'can admit attendees' do
      jeffco_fair.admit(bob)
      jeffco_fair.admit(sally)
      jeffco_fair.admit(johnny)

      expect(jeffco_fair.attendees).to eq([bob, sally, johnny])
    end

    it 'has attendees by ride interest' do
      expected = {bumper_cars=> [bob, sally, johnny], ferris_wheel=>[bob], scrambler=>[]}
      expect(jeffco_fair.attendees_by_ride_interest).to eq(expected)
    end

    it 'has ticket lottery contestants' do

      expect(jeffco_fair.ticket_lottery_contestants(bumper_cars)).to eq([bob, johnny])
      expect(jeffco_fair.ticket_lottery_contestants(ferris_wheel)).to eq([])
      expect(jeffco_fair.ticket_lottery_contestants(scrambler)).to eq([])
    end

    it 'has a draw lottery winner' do

      expect(jeffco_fair.draw_lottery_winner(bumper_cars)).to eq(bob).or eq(johnny)
      expect(jeffco_fair.draw_lottery_winner(ferris_wheel)).to eq(nil)
      expect(jeffco_fair.draw_lottery_winner(scrambler)).to eq(nil)
    end

    xit 'has a announce lottery winner' do

      expect(jeffco_fair.announce_lottery_winner(bumper_cars)).to eq("has won the bumper car lottery")
      expect(jeffco_fair.announce_lottery_winner(ferris_wheel)).to eq("No winners for this lottery")
      expect(jeffco_fair.announce_lottery_winner(scrambler)).to eq("Bob has won the IMAX exhibit")
    end
  end
end

# - You will need to use a **stub** to test the `announce_lottery_winner`
# method in conjunction with the `draw_lottery_winner` method. JOY!