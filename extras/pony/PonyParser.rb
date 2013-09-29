#encode utf-8
class PonyParser
	def self.quotes(params,extra)
		quote = Quote.new()
		quote.companyName = 'Pony Express'
		quote.price,quote.time= PonyParser.definePriceAndTime(params,extra)
		quote
	end


	#wsdl requests to pony API
	#extra[0] код типа доставки цифрой (i.e.delivery_mode)
	def self.definePriceAndTime(params,extra)
		client = Savon.new("#{Rails.root}/extras/pony/tariff_ws.wsdl")
		service_name = "PonyRatesService"
		port_name = "PonyRatesPort"
		operation_name = :getRate
		# direction равно 3, если по городу и 2, если между (1 - международная)
		direction = params[:from]==params[:to]?3:2 
		operation = client.operation(service_name, port_name, operation_name)
		operation.header = {}
		operation.body = {:getRateRequest=>{:org_city=>params[:from],
											:dest_city=>params[:to],
											:item_count=>1,
											:weight=>params[:weight],
											:direction=>direction,
											:delivery_mode=>extra[0].to_i}}
		result = operation.call.body[:get_rate_response]
		if result[:tariff]=="0"||result[:error_code]!="0"
			return [nil,nil]
		end
		[result[:tariff_including_vat],result[:delivery_days]]
	end

end