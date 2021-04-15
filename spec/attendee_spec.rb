require './lib/ride'
require './lib/attendee'

RSpec.describe Attendee do
  context 'exists' do
     attendee = Attendee.new('Bob', 20)

    it 'is a attendee' do
      expect(attendee).to be_instance_of(Attendee)
    end

    it 'has attributes' do

      expect(attendee.name).to eq('Bob')
      expect(attendee.spending_money).to eq(20)
      expect(attendee.interests).to eq([])
    end
  end

  context 'can modify attributes' do
    attendee = Attendee.new('Bob', 20)

    it 'can add interests' do
      attendee.add_interest('Bumper Cars')
      attendee.add_interest('Ferris Wheel')
      expected = ["Bumper Cars", "Ferris Wheel"]
      expect(attendee.interests).to eq(expected)
    end
  end
end