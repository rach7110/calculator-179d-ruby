require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative 'calculator.rb'

describe Calculator do

  describe '.initialize' do
    context 'If footprint is not included' do
      it 'should return an error message' do
        expect{Calculator.new}.to raise_error
      end
    end

    context 'If only a footprint is included' do
    	it 'it should set the building\'s footprint' do
    		calc = Calculator.new(100)

    		expect(calc.footprint).to eq(100)
    	end

    	it 'should set the light, hvac, and envelope to false' do
    		calc = Calculator.new(500)

    		expect(calc.light).to be_false
    		expect(calc.hvac).to be_false
    	end
    end

    context 'If light, hvac, or envelope is included' do
    	it 'should set light to true' do
    		calc = Calculator.new(100, true)

    		expect(calc.light).to be_true
    	end

    	it 'should set hvac to true' do
    		calc = Calculator.new(100, true, true)

    		expect(calc.hvac).to be_true
    	end

    	it 'should set envelope to true' do
    		calc = Calculator.new(100, true, true, true)

    		expect(calc.env).to be_true
    	end
    end
  end

  describe '#benefit_light' do
  	context 'When light is not included.' do
  		it 'The benefit from light should equal 0' do
  			benny = Calculator.new(100)

  			expect(benny.benefit_light).to eq(0)
  		end
  	end

  # 	context 'When light is included.' do
  # 		it 'The benefit from light should equal the rate for light * the buidling\'s footprint' do
  # 			calc = Calculator.new(100, true)
  # 			benefit = calc.footprint * @@rate_light

  # 			expect(calc.benefit_light).to eq(@footprint * 0.60)
  # 		end
  # 	end
  end
end