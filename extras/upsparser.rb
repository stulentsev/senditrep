class UpsParser

	require 'net/http'
	def self.quotes(params,extra)
		quote = Quote.new()
		quote.companyName = 'UPS'
		quote.price, quote.time = [200,2]#UpsParser.definePriceAndTime(params,extra)
		quote
	end


	private

	def self.definePriceAndTime(params,extra)
		client = Savon.new("#{Rails.root}/extras/ups/RateWS.wsdl")
		result = client.services
		
		service_name = "RateService"
		port_name = "RatePort"
		operation_name = :ProcessRate

		operation = client.operation(service_name, port_name,operation_name)
		#result = client.operations(service_name, port_name)
		result = operation.example_body
		

		[result, 2]
	end
end