# encoding: utf-8
class Emslocation < ActiveRecord::Base

  #Return code of city/region by its name
  # TODO: unidiomatic name.
  def self.locationCode(name)
  	code = Emslocation.where('name = ?', name.mb_chars.upcase).first
    # return I18n.t("messages.nothing") unless code
  	if code.nil?
  		return 'Nothing'
  	end
  	code.value
  end

end
