# encoding: utf-8
class Emslocation < ActiveRecord::Base

  #Return code of city/region by its name
  def self.locationCode(name)
  	code = Emslocation.where('name = ?', name.mb_chars.upcase).first
  	Rails.logger.info "InfoMessage:"
  	Rails.logger.info code
  	if code.nil?
  		return 'Nothing'
  	end
  	code.value
  end

end
