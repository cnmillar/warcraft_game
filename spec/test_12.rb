require_relative 'spec_helper'

# Units start off alive but they die if their HP hits 0 or lower. 
# This is usually a result of receiving damage from combat.

describe Unit do
	
	before :each do
		@unit = Unit.new(60, 10)
	end

	describe "#initialize" do
		it "a new unit should be alive" do
			expect(@unit.alive).to be_truthy
		end
	end

	describe "#damage" do
		it "if HP = 0, then the unit is dead" do
			@unit.damage(60)
			expect(@unit.alive).to be_falsey
		end

		it "if HP < 0, then the unit is dead" do
			@unit.damage(70)
			expect(@unit.alive).to be_falsey
		end
	end
end