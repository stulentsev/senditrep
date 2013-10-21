class UpsParser
	require 'active_shipping'
	include ActiveMerchant::Shipping

	def self.quotes(params,extra)
		quote = Quote.new()
		quote.companyName = 'UPS'
		quote.price, quote.time = UpsParser.definePriceAndTime(params,extra)
		quote
	end


	private

	def self.definePriceAndTime(params,extra)
		# Package up a poster and a Wii for your nephew.
		packages = [
		  Package.new(  params[:weight]*1000,      	#  grams to kg
		                [1,1,1])         
		]

		# You live in Beverly Hills, he lives in Ottawa
		origin = Location.new(      :country => 'RU',
		                            :zip => '101000')

		destination = Location.new( :country => 'RU',
		                            :postal_code => '196142')

		# Find out how much it'll be.
		ups = UPS.new(:login => ENV["UPS_LOGIN"], :password => ENV["UPS_PASSWORD"],
												  :key => ENV["UPS_KEY"])
		begin
			response = ups.find_rates(origin, destination, packages)
			ups_rates = response.rates.collect{|rate| [rate.service_name, rate.price, rate.delivery_date]}.first
			p ups_rates			
		rescue Exception=>e
			p e
			return [nil,nil]
		end
		#count how many days by date
		days = ((ups_rates[2].to_i - DateTime.now.to_i).to_f/60/60/24).ceil
		[ups_rates[1].to_f/100,days]
	end
end