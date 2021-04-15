# Carnival

## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* COMMIT YOUR TESTS FIRST! We will check for TDD via your git history.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
* Put your name in your PR!

### Iteration 1

Use TDD to create a `Ride` and a `Attendee` class that respond to the following interaction pattern:

```ruby
pry(main)> require './lib/ride'
#=> true

pry(main)> require './lib/attendee'
#=> true

pry(main)> ride = Ride.new({name: 'Ferris Wheel', cost: 0})
#=> #<Ride:0x00007ff88ea3fc30...>

pry(main)> ride.name
#=> "Ferris Wheel"

pry(main)> ride.cost
#=> 0

pry(main)> attendee = Attendee.new('Bob', 20)
#=> #<Attendee:0x00007ff88ea979a8...>

pry(main)> attendee.name
#=> "Bob"

pry(main)> attendee.spending_money
#=> 20

pry(main)> attendee.interests
#=> []

pry(main)> attendee.add_interest('Bumper Cars')

pry(main)> attendee.add_interest('Ferris Wheel')

pry(main)> attendee.interests
#=> ["Bumper Cars", "Ferris Wheel"]

```

## Iteration 2

Use TDD to create a `Carnival` class that responds to the following interaction pattern. For the `recommend_rides` method, the `Carnival` should recommend rides that match an `Attendee`'s interests.

```ruby
pry(main)> require './lib/carnival'
#=> true

pry(main)> require './lib/attendee'
#=> true

pry(main)> require './lib/ride'
#=> true

pry(main)> jeffco_fair = Carnival.new("Jefferson County Fair")
#=> #<Carnival:0x00007fe593a28728...>

pry(main)> jeffco_fair.name
#=> "Jefferson County Fair"

pry(main)> jeffco_fair.rides
#=> []

pry(main)> ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
#=> #<Ride:0x00007fe59506ede8...>

pry(main)> bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
#=> #<Ride:0x00007fe594851930...>

pry(main)> scrambler = Ride.new({name: 'Scrambler', cost: 15})
#=> #<Ride:0x00007fe59314eb98...>

pry(main)> jeffco_fair.add_ride(ferris_wheel)

pry(main)> jeffco_fair.add_ride(bumper_cars)

pry(main)> jeffco_fair.add_ride(scrambler)

pry(main)> jeffco_fair.rides
#=> [#<Ride:0x00007fe59506ede8...>, #<Ride:0x00007fe594851930...>, #<Ride:0x00007fe59314eb98...>]

pry(main)> bob = Attendee.new('Bob', 20)
#=> #<Attendee:0x00007fe59507dc80...>

pry(main)> sally = Attendee.new('Sally', 20)
#=> #<Attendee:0x00007fe593ac3318...>

pry(main)> bob.add_interest('Ferris Wheel')

pry(main)> bob.add_interest('Bumper Cars')

pry(main)> sally.add_interest('Scrambler')

pry(main)> jeffco_fair.recommend_rides(bob)
#=> [#<Ride:0x00007fe59506ede8...>, #<Ride:0x00007fe594851930...>]

pry(main)> jeffco_fair.recommend_rides(sally)
#=> [#<Ride:0x00007fe59314eb98...>]
```

## Iteration 3

- Use TDD to update your `Carnival` class so that it responds to the following interaction pattern.
- For `attendees_by_ride_interest`, this method takes no arguments and returns a Hash where each key is a Ride. The value associated with that Ride is an Array of all the Attendees that have an interest in that ride.
- `ticket_lottery_contestants` returns an array of attendees that do not have enough money to go on a particular ride, but are interested in that ride. The lottery winner is generated randomly based on the available contestants when `draw_lottery_winner` is called.
- You will need to use a **stub** to test the `announce_lottery_winner` method in conjunction with the `draw_lottery_winner` method. JOY!

```ruby
pry(main)> require './lib/carnival'
#=> true

pry(main)> require './lib/attendee'
#=> true

pry(main)> require './lib/ride'
#=> true

pry(main)> jeffco_fair = Carnival.new("Jefferson County Fair")
#=> #<Carnival:0x00007ffab5a2e3f8...>

pry(main)> ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
#=> #<Ride:0x00007ffab5a3d3a8...>

pry(main)> bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
#=> #<Ride:0x00007ffab714bce8...>

pry(main)> scrambler = Ride.new({name: 'Scrambler', cost: 15})
#=> #<Ride:0x00007ffab71607d8...>

pry(main)> jeffco_fair.add_ride(ferris_wheel)

pry(main)> jeffco_fair.add_ride(bumper_cars)

pry(main)> jeffco_fair.add_ride(scrambler)

pry(main)> jeffco_fair.attendees
#=> []

pry(main)> bob = Attendee.new("Bob", 0)
#=> #<Attendee:0x00007ffab70bfce8...>

pry(main)> bob.add_interest('Ferris Wheel')

pry(main)> bob.add_interest('Bumper Cars')

pry(main)> sally = Attendee.new('Sally', 20)
#=> #<Attendee:0x00007ffab69069e8...>

pry(main)> sally.add_interest('Bumper Cars')

pry(main)> johnny = Attendee.new("Johnny", 5)
#=> #<Attendee:0x00007ffab7172d70...>

pry(main)> johnny.add_interest('Bumper Cars')

pry(main)> jeffco_fair.admit(bob)

pry(main)> jeffco_fair.admit(sally)

pry(main)> jeffco_fair.admit(johnny)

pry(main)> jeffco_fair.attendees
#=> [#<Attendee:0x00007ffab70bfce8...>, #<Attendee:0x00007ffab69069e8...>, #<Attendee:0x00007ffab7172d70...>]

#Attendees are added even if they don't have enough money for all/any exhibits.

pry(main)> jeffco_fair.attendees_by_ride_interest
#=> {
#    #<Ride:0x00007ffab5a3d3a8...> => [#<Attendee:0x00007ffab70bfce8...>],
#    #<Ride:0x00007ffab714bce8...> => [#<Attendee:0x00007ffab70bfce8...>, #<Attendee:0x00007ffab69069e8...>, #<Attendee:0x00007ffab7172d70...>],
#    #<Ride:0x00007ffab71607d8...> => []
#  }

pry(main)> jeffco_fair.ticket_lottery_contestants(bumper_cars)
#=> [#<Attendee:0x00007ffab70bfce8...>, #<Attendee:0x00007ffab7172d70...>]

pry(main)> jeffco_fair.draw_lottery_winner(bumper_cars)
#=> "Johnny"

#In the above method, with this setup, "Johnny" or "Bob" could be returned here - Fun!

pry(main)> jeffco_fair.draw_lottery_winner(ferris_wheel)
#=> nil

#If no contestants are eligible for the lottery, nil is returned.

pry(main)> jeffco_fair.announce_lottery_winner(scrambler)
#=> "Bob has won the IMAX exhibit"

#We realize that, in this setup, Bob is not interested in the scrambler.  However, in your test, the result should match exactly.  You will need to stub the return of `draw_lottery_winner` as the above method should depend on that method :)

pry(main)> jeffco_fair.announce_lottery_winner(ferris_wheel)
#=> "No winners for this lottery"

#If there are no contestants, there are no winners.

```

## Iteration 4

Use TDD to update your `Carnival` class to add the following functionality:

* When an `Attendee` is admitted to the `Carnival`, they go on `Rides`. The `Rides` that an `Attendee` goes on follows these rules:
* An `Attendee` will only go on `Rides` they are interested in
* An `Attendee` will got on a `Ride` with a higher cost before a `Ride` with a lower cost.
* If an `Attendee` does not have enough `spending_money` to cover the cost of the `Ride`, they will not go on the `Ride`.
* When the `Attendee` goes on a `Ride`, the cost of the `Ride` should be subtracted from their `spending_money` and added to the `Carnival` revenue.
* A `Carnival` should have a `attendees_of_rides` method that returns a Hash where the keys are the `Rides` and the values are Arrays containing all the `Attendees` that go on that `Ride`.
* A `Carnival` should have a method `revenue` that returns an integer representing the revenue collected from `Attendees` going on `Rides`.

The `Carnival` class should respond to the following interaction pattern:

```ruby
pry(main)> require './lib/carnival'
#=> true

pry(main)> require './lib/attendee'
#=> true

pry(main)> require './lib/ride'
#=> true

pry(main)> jeffco_fair = Carnival.new("Jefferson County Fair")
#=> #<Carnival:0x00007fc205098bb0...>

pry(main)> ferris_wheel = Ride.new({name: 'Ferris Wheel', cost: 0})
#=> #<Ride:0x00007fc204953198...>

pry(main)> scrambler = Ride.new({name: 'Scrambler', cost: 15})
#=> #<Ride:0x00007fc20494a7a0...>

pry(main)> bumper_cars = Ride.new({name: 'Bumper Cars', cost: 10})
#=> #<Ride:0x00007fc20584e170...>

pry(main)> jeffco_fair.add_ride(ferris_wheel)

pry(main)> jeffco_fair.add_ride(bumper_cars)

pry(main)> jeffco_fair.add_ride(scrambler)

# This Attendee is interested in two rides but none are in their price range, so they go on none :(

pry(main)> tj = Attendee.new("TJ", 7)
#=> #<Attendee:0x00007fc2050885a8...>

pry(main)> tj.add_interest('Scrambler')

pry(main)> tj.add_interest('Bumper Cars')

pry(main)> jeffco_fair.admit(tj)

pry(main)> jeffco_fair.attendees_of_rides
#=> {}

pry(main)> jeffco_fair.revenue
#=> 0

pry(main)> tj.spending_money
#=> 7

# This Attendee is interested in two rides and only `bumper_cars` is in their price range price, so they ride `bumper_cars`

pry(main)> bob = Attendee.new("Bob", 10)
#=> #<Attendee:0x00007fc203a3bbb0...>

pry(main)> bob.add_interest('Bumper Cars')

pry(main)> bob.add_interest('Scrambler')

pry(main)> jeffco_fair.admit(bob)

pry(main)> jeffco_fair.attendees_of_rides
#=> {
#     #<Ride:0x00007fc20584e170...> => [#<Attendee:0x00007fc203a3bbb0...>]
#   }

pry(main)> jeffco_fair.revenue
#=> 10

pry(main)> bob.spending_money
#=> 0

# This Attendee is interested in two rides and both are in their price range. They go on the more expensive one first (`scrambler`), but don't have enough money to go on the second one

pry(main)> sally = Attendee.new("Sally", 20)
#=> #<Attendee:0x00007fc203a4b650...>

pry(main)> sally.add_interest('Scrambler')

pry(main)> sally.add_interest('Bumper Cars')

pry(main)> jeffco_fair.admit(sally)

pry(main)> jeffco_fair.attendees_of_rides
#=> {
#      #<Ride:0x00007fc20584e170...> => [#<Attendee:0x00007fc203a3bbb0...>],
#      #<Ride:0x00007fc20494a7a0...> => [#<Attendee:0x00007fc203a4b650...>]
#    }

pry(main)> jeffco_fair.revenue
#=> 25

pry(main)> sally.spending_money
#=> 5

# This Attendee is interested in two rides and both are in their price range, so they go on both.

pry(main)> morgan = Attendee.new("Morgan", 15)
#=> #<Attendee:0x00007fc203a5b528...>

pry(main)> morgan.add_interest('Ferris Wheel')

pry(main)> morgan.add_interest('Bumper Cars')

pry(main)> jeffco_fair.admit(morgan)

pry(main)> jeffco_fair.attendees_of_rides
#=> {
#      #<Ride:0x00007fc20584e170...> => [#<Attendee:0x00007fc203a3bbb0...>, #<Attendee:0x00007fc203a5b528...>],
#      #<Ride:0x00007fc20494a7a0...> => [#<Attendee:0x00007fc203a4b650...>],
#      #<Ride:0x00007fc204953198...> => [#<Attendee:0x00007fc203a5b528...>]
#    }

pry(main)> jeffco_fair.revenue
#=> 35

pry(main)> morgan.spending_money
#=> 5
```
