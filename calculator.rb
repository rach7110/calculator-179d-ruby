class Calculator
  attr_accessor :footprint, :light, :hvac, :env
  attr_reader :rate_light, :rate_hvac, :rate_env

  def initialize(footprint, light=false, hvac=false, env=false)
    @footprint = footprint
    @light = light
    @hvac = hvac
    @env = env
    @rate_light = 0.60
    @rate_hvac = 0.60
    @rate_env = 0.60

  end	

  #Calculates the tax benefit from the building's lighting 
  def benefit_light
    if @light == true
      @footprint * @rate_light
    else
      0
    end
  end

  #Calculates the tax benefit from the building's HVAC 
  def benefit_hvac
    if @hvac == true
      @footprint * @rate_hvac
    else
      0
    end
  end

  #Calculates the tax benefit from the building's envelope
  def benefit_env
    if @env == true
      @footprint * @rate_env
    else
      0
    end
  end

  #Calculates the building's total tax benefit 
  def benefit_total
    benefit_light + benefit_hvac + benefit_env
  end
end