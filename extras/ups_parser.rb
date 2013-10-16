class UpsParser

	def self.quotes(params,extra)
		quote = Quote.new()
		quote.companyName = 'UPS'
		quote.price, quote.time = UpsParser.definePriceAndTime(params,extra)
		quote
	end


	private

	def self.definePriceAndTime(params,extra)
		client = Savon.new("#{Rails.root}/extras/ups/RateWS.wsdl")
	
		service_name = "RateService"
		port_name = "RatePort"
		operation_name = "ProcessRate"

		operation = client.operation(service_name, port_name, operation_name)
		result = operation
		p result
		puts "*******************************"
		
		[nil,nil]
	end
end