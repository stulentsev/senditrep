#encode utf-8
class PonyParser
	def self.quotes(params)
		quote = Quote.new()
		quote.companyName = 'Pony Express'
		quote.price,quote.time= PonyParser.definePriceAndTime(params)
		
		quote
	end



	def self.definePriceAndTime(params)
		#client = Savon.new('http://example.com?wsdl')
		client = Savon.new("#{Rails.root}/extras/pony/tariff_ws.wsdl")
		service_name = "PonyRatesService"
		port_name = "PonyRatesPort"
		operation_name = :getRate
		 
		operation = client.operation(service_name, port_name, operation_name)
		operation.header = {}
		operation.body = {:getRateRequest=>{:org_city=>params[:from], 
											:dest_city=>params[:to], 
											:item_count=>1, 
											:weight=>4.5, 
											:direction=>2, 
											:delivery_mode=>2}}
		result = operation.call.body

		[result[:get_rate_response][:tariff],result[:get_rate_response][:delivery_days]]
	end

	# def self.definePriceAndTime(params)
	# 	client = Savon.client(wsdl: "#{Rails.root}/extras/pony/tariff_ws.wsdl")
	# 	client.call(:get_rate,
	# 		message:{ 	
	# 					item_count: 2.to_i,
	# 					org_city: params[:from], 
	# 					dest_city: params[:to],
	# 					direction: 2,
	# 					delivery_mode: 2, 
	# 					weight: params[:weight]						
	# 				})
	# end
end