require_relative 'spec_helper'

# Aside from gold and food, there is also the concept of lumber. 
# Add lumber as a resource that the barracks can handle.
# A Barracks can start off with 500 lumber.

describe Barracks do
	
	describe "#initialize" do
		it "a new barracks should have 500 lumber" do
			barracks = Barracks.new
			expect(barracks.lumber).to eq(500)
		end
	end

end