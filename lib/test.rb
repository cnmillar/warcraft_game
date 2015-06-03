require './lib/barracks.rb'
require './lib/footman.rb'

# test_barrack = Barracks.new
# test_barrack.can_train_footman?
test_foot = Footman.new
enemy = Footman.new
barrack = Barracks.new
# test_foot.damage(enemy.health_points)
# puts test_foot.health_points

test_foot.attack!(barrack)
puts barrack.health_points