require_relative 'spec_helper'

# A dead unit cannot attack another unit. Conversely, an alive 
# unit will also not attack another unit that is already dead.

describe Unit do 

	before :each do
		@enemy = Unit.new(60,10)
		@attacker = Unit.new(60,10)
	end

	describe "#attack!" do
		it "a dead unit can't attack another unit" do
			@attacker.damage(60)
			old_enemy_hp = @enemy.health_points
			@attacker.attack!(@enemy)
			expect(@enemy.health_points).to eq(old_enemy_hp)
		end

		it "an alive unit can't attack a dead unit" do
			@enemy.damage(60)
			old_enemy_hp = @enemy.health_points
			@attacker.attack!(@enemy)
			expect(@enemy.health_points).to eq(old_enemy_hp)
		end
	end

end

