class Emslocation < ActiveRecord::Base
  attr_accessible :locationtype, :name, :value

  #Return code of city/region by its name
  def self.locationCode(name)
  	if name == 'Москва'
		return 'city--moskva'
	else
		return 'region--omskaja-oblast'
	end
  end
end
