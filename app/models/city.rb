class City < ActiveRecord::Base
	has_many :indices, dependent: :destroy

	def self.parseAddress(addressLine)
		["Москва", "Москва", 101000]
	end
end
