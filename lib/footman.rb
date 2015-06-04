require './lib/unit.rb'

class Footman < Unit
	attr_reader :attack_power
	attr_accessor :health_points

  def initialize
  	@health_points = 60
  	@attack_power = 10
	end
end
