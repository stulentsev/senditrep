class UpsParser
	require 'active_shipping'
	include ActiveMerchant::Shipping

	def self.quotes(params,extra)
		quote = Quote.new()
		quote.companyName = 'UPS'
		quote.price, quote.time = [nil,nil]#UpsParser.definePriceAndTime(params,extra)
		quote
	end


	private

	def self.definePriceAndTime(params,extra)
		# Package up a poster and a Wii for your nephew.
		packages = [
		  Package.new(  params[:weight]*1000,      	#  grams to kg
		                [93,10,20])         # cylinders have different volume calculations
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
			p response.rates[0].methods - Object.methods
			ups_rates = response.rates.collect {|rate| [rate.service_name, rate.price, rate.delivery_date]}
			p ups_rates			
		rescue Exception=>e
			p e
		ensure
			puts "**************************"
		end			
		[ups_rates[0][1].to_f/100,200]
	end
end