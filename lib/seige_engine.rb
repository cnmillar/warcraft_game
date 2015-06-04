require './lib/unit.rb'

class SeigeEngine < Unit

	def initialize
		@health_points = 400
		@attack_power = 50
	end

	def attack!(enemy)
		enemy.damage(0) if enemy.is_a? Footman
		enemy.damage(0) if enemy.is_a? Peasant
		enemy.damage(@attack_power) if enemy.is_a? SeigeEngine
		enemy.damage(2 * @attack_power) if enemy.is_a? Barracks
	end

	def damage(a_power)
		@health_points -= a_power
	end
end