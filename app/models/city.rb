class City < ActiveRecord::Base
	has_many :indices, dependent: :destroy
	has_one :spsr_location

	def self.parse_address(address_line)
		begin
			address = address_line.mb_chars.downcase.to_s.split(/, */)
			if address.length == 1
				city = self.where("city_name = ?", address[0]).first
			elsif address.length == 2
				city = self.where("city_name = ?", address[0])
				if city.length>1
					city = self.where("city_name = ? AND city_region = ?", address[0],address[1])
				end
				city = city.first
			end
			[city.city_name, city.city_region, city.indices.first.city_index]
		rescue
			[nil,nil,nil]
		end
	end
end
