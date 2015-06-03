require 'pry'
class Unit
	attr_reader :health_points, :attack_power, :alive

	def initialize(health_points, attack_power)
		@health_points = health_points
		@attack_power = attack_power
		@alive = true
	end

	 def damage(a_power)
  	@health_points -= a_power
  	@alive = false if @health_points <= 0
  end

   def attack!(enemy)
   	if @health_points > 0 && enemy.health_points > 0
	  	if enemy.instance_of? Unit
	  		enemy.damage(@attack_power)
	  	elsif enemy.instance_of? Barracks
	  		enemy.damage((@attack_power/2).ceil)
	  	end
	  end
  end
end