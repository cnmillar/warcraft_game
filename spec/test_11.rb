require_relative 'spec_helper'

# In most strategy games, like Warcraft III, buildings can 
# also be attacked by units. Since a barracks is a building, 
# it has substantial more HP (500) To make matters worse, a 
# Footman does only HALF of its AP as damage to a Barracks. 
# This is because they are quite ineffective against buildings.

describe Barracks do

	before :each do
		@barracks = Barracks.new
	end
	
	describe "#initialize" do
		it "a new barrack starts off with 500 health points" do
			expect(@barracks.health_points).to eq(500)
		end	
	end

	describe "#damage_building" do
		it "should reduce the building's health_points by the attack_power supplied" do
			@barracks.damage(50)
			expect(@barracks.health_points).to eq(450)
		end
	end
end

describe Footman do

	before :each do
		@footman = Footman.new
	end

	describe "#attack_building" do
		it "a footman uses only half of its attack_power on a building" do
			enemy = Barracks.new
			enemy.should_receive(:damage).with(5)
			@footman.attack!(enemy)
		end
	end
end

