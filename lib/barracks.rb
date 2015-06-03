require 'pry'

class Barracks
	attr_reader :gold, :food, :health_points, :lumber
	def initialize
		@gold = 1000
		@food = 80
		@health_points = 500
		@lumber = 500
	end

  def can_train_footman?
  	gold >= 135 && food >= 2
  end

  def train_footman
  	if can_train_footman?
	  	@gold -= 135
	  	@food -= 2
	  	Footman.new
	  end
  end

  def train_peasant
  	if can_train_peasant?
  		@gold -= 90
  		@food -= 5
  		Peasant.new
  	end
  end

  def can_train_peasant?		# where in the assignment does it say what a peasant needs and costs?
  	food >= 5 && gold >= 90
  end

  def damage(damage_amount)
  	@health_points -= damage_amount
  end
end
