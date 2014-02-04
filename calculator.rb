class Calculator
  attr_accessor :footprint, :light, :hvac, :env
  @rate_light = 0.60


  def initialize(footprint, light=false, hvac=false, env=false)
    @footprint = footprint
    @light = light
    @hvac = hvac
    @env = env

  end	

  def benefit_light
    if light == true
      # footprint * @rate_light
    else
      0
    end

  end

  def benefit_hvac

  end

  def benefit_env

  end


end
