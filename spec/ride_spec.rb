require './lib/ride'

RSpec.describe Ride do
  context 'exists' do
    ride = Ride.new({name: 'Ferris Wheel', cost: 0})

    it 'is a ride' do
      expect(ride).to be_instance_of(Ride)
    end

    it 'has attributes' do
      expect(ride.name).to eq('Ferris Wheel')
      expect(ride.cost).to eq(0)
    end
  end
end