require_relative 'spec_helper'

# Introduce a SiegeEngine Unit. The SiegeEngine is very effective 
# against buildings such as the Barracks. It is however ineffective 
# against other units (can't attack them, as though they were dead).

# So unlike with Footman (whose attacks do a fraction of the damage 
	# they normally would), the SiegeEngine does 2x the damage against 
# the Barracks

# Also, Siege Engines can attack other siege engines even though they 
# cannot attack any other units (such as Peasants or Footmen)

# Stats: AP = 50, HP = 400
# Cost: 200 gold, 60 lumber, 3 food

describe SeigeEngine do

	before :each do
		@seige_engine = SeigeEngine.new
	end

	describe "#initialize" do
		it "a new SeigeEngine should have HP = 400" do
			expect(@seige_engine.health_points).to eq(400)
		end

		it "a new SeigeEngine should have AP = 50" do
			expect(@seige_engine.attack_power).to eq(50)
		end
	end

	describe "#attack!" do
		it "seige_engine can't attack footman" do
      enemy = Footman.new
      enemy.should_receive(:damage).with(0)
      @seige_engine.attack!(enemy)
		end	

		it "seige_engine can't attack peasants" do
      enemy = Peasant.new
      enemy.should_receive(:damage).with(0)
      @seige_engine.attack!(enemy)
		end	

		it "seige_engine can attack other SeigeEngines with attack_power damage" do
      enemy = SeigeEngine.new
      enemy.should_receive(:damage).with(50)
      @seige_engine.attack!(enemy)
		end	

		it "seige_engine can attack Barracks with 2 times the attack_power damage" do
      enemy = Barracks.new
      enemy.should_receive(:damage).with(100)
      @seige_engine.attack!(enemy)
		end	
	end

	describe "#damage" do
		it "seige_engine can take on damage from other units at the regular AP" do
      expect(@seige_engine.damage(100)).to eq(300)
		end
	end
end

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end
	  
  describe "#can_train_seige?" do
    it "returns true if there are enough resources to train a seige engine" do
      expect(@barracks.can_train_seige?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      @barracks.should_receive(:food).and_return(2)
      expect(@barracks.can_train_seige?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      @barracks.should_receive(:gold).and_return(89)
      expect(@barracks.can_train_seige?).to be_falsey
    end

    it "returns false if there isn't enough lumber" do
      @barracks.should_receive(:lumber).and_return(59)
      expect(@barracks.can_train_seige?).to be_falsey
    end
  end
   describe "#train_seige" do
    it "does not train a seige engine if there aren't enough resources" do
      @barracks.should_receive(:can_train_seige?).and_return(false)
      expect(@barracks.train_seige).to be_nil
    end
    it "trains a seige engine if there are enough resources" do
      @barracks.should_receive(:can_train_seige?).and_return(true)
      expect(@barracks.train_seige).to be_a(SeigeEngine)
    end
  end
end
