require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative 'calculator.rb'

describe Calculator do
  before :each do
    @calc = Calculator.new(100)
  end

  describe '.initialize' do
    context 'If footprint is not included' do
      it 'should return an error message' do
        expect{Calculator.new}.to raise_error
      end
    end

    context 'If only a footprint is included' do
    	it 'it should create a calculator instance and set the footprint' do
    		expect(@calc.footprint).to eq(100)
    	end

    	it 'should set the light, hvac, and envelope to false' do
    		expect(@calc.light).to be_false
    		expect(@calc.hvac).to be_false
        expect(@calc.env).to be_false
    	end
    end

    context 'If light, hvac, or envelope is included' do
    	it 'should set light to true' do
        @calc.light = true

    		expect(@calc.light).to be_true
    	end

    	it 'should set hvac to true' do
        @calc.hvac = true

    		expect(@calc.hvac).to be_true
    	end

    	it 'should set envelope to true' do
        @calc.env = true

    		expect(@calc.env).to be_true
    	end
    end
  end

  describe '#benefit_light' do
  	context 'When light is not included.' do
  		it 'The benefit from light should equal 0' do
  			expect(@calc.benefit_light).to eq(0)
  		end
  	end

  	context 'When light is included.' do
  		it 'The benefit from light should equal the rate for light * the buidling\'s footprint' do
        @calc.light = true
        l_benefit = @calc.rate_light * @calc.footprint
        
  			expect(l_benefit).to eq(@calc.benefit_light)
  		end
  	end
  end

  describe '#benefit_hvac' do
    context 'When hvac is not included' do
      it 'The benefit fom hvac should equal 0' do
        expect(@calc.benefit_hvac).to eq(0)
      end
    end

    context 'When hvac is included' do
      it 'The benefit from hvac should equal the rate for hvac * the buidling\'s footprint' do
        @calc.hvac = true
        h_benefit = @calc.rate_hvac * @calc.footprint

        expect(h_benefit).to eq(@calc.benefit_hvac)
      end
    end
  end

  describe '#benefit_env' do
    context 'When envelope is not included' do
      it 'The benefit from envelope should equal 0' do
        expect(@calc.benefit_env).to eq(0)
      end
    end
    
    context 'When envelope is included' do
      it 'The benefit from envelope should be the rate for envelope * the build\'s footprint' do
        @calc.env = true
        e_benefit = @calc.rate_env * @calc.footprint
        
        expect(e_benefit).to eq(@calc.benefit_env)
      end
    end
  end

  describe '#benefit_total' do
    context 'When lighting, hvac, and envelope are not included' do
      it 'Total benefit should equal 0' do
        expect(@calc.benefit_total).to eq(0)
      end
    end
  end
end