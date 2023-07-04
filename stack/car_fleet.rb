# string_frozen_literal: true

# Time complexity: O(n * logn)
# Space complexity: O(n)
def car_fleet(target, position, speed)
  cars = []
  0.upto(position.length - 1) { |i| cars << [position[i], speed[i]] }
  cars.sort_by! { |car| -car[0] }

  fleets = []

  cars.each do |car|
    if fleets.empty?
      fleets << time_to_target(car, target)
    else
      eta = time_to_target(car, target)
      fleets << eta if fleets[-1] < eta
    end
  end

  fleets.length
end

def time_to_target(car, target)
  (target - car[0]) / Float(car[1])
end
