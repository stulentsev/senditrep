class DpdParser
	def self.quotes(params,extra)
		quote = Quote.new()
		quote.companyName = 'DPD'
		quote.price,quote.time = DpdParser.definePriceAndTime(params,extra)
		quote
	end

	private
	def self.definePriceAndTime(params,extra)
		operation = DpdParser.formOperation(params,extra)
		result = operation.call.body
		if !result[:fault].blank?
			return [nil,nil]
		end
		result = result[:get_service_cost_response][:return]
		[result[:cost],result[:days]]
	end

	def self.formOperation(params,extra)
		client = Savon.new("#{Rails.root}/lib/dpd/dpd_price.wsdl")
		service_name = "DPDCalculatorService"
		port_name = "DPDCalculatorPort"
		operation_name = :getServiceCost
		operation = client.operation(service_name, port_name, operation_name)
		
		operation.header = {}
		
		operation.body = {:getServiceCost=>
							{:request=>
								{:auth=>
									{:clientNumber => ENV["DPD_CLIENT_NUMBER"], 
									:clientKey => ENV["DPD_CLIENT_KEY"]}, 
								:pickup=>
									{ 
									:cityName => params[:city_from]}, 
								:delivery=>
									{
									:cityName => params[:city_to]}, 
								:selfPickup=>false, 
								:selfDelivery=>false, 
								:weight=>params[:weight],
								:serviceCode=>extra[0]}}}
		operation
	end

end