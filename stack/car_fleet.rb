# string_frozen_literal: true

# Time complexity: O(n * logn)
# Space complexity: O(n)
def car_fleet(target, position, speed)
  cars = position.each_index.map { |i| [position[i], speed[i]] }
  fleets = []

  cars.sort_by { |car| -car[0] }.each do |car|
    eta = time_to_target(car, target)
    fleets << eta if fleets.empty? || fleets[-1] < eta
  end

  fleets.length
end

def time_to_target(car, target)
  (target - car[0]) / Float(car[1])
end
