class Calculator
  attr_accessor :footprint, :lighting, :hvac, :env

  def initialize(footprint, lighting=false, hvac=false, env=false)
    @footprint = footprint
    @lighting = lighting
    @hvac = hvac
    @env = env
  end	

  def benefit_light

  end

  def benefit_hvac

  end

  def benefit_env

  end


end
