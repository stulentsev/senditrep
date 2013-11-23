# TODO: Remove encoding specification and cyrillic literal strings/comments from all code files.
# Nothing good can come out of it.
#encode utf-8
class PonyParser
	def self.quotes(params,extra)
		quote = Quote.new()
		quote.company_name = 'Pony Express'
		quote.price,quote.days=[200,2]#PonyParser.definePriceAndTime(params,extra)
		quote
	end

	private
	#wsdl requests to pony API
	#extra[0] код типа доставки цифрой (i.e.delivery_mode)
	def self.definePriceAndTime(params,extra)
		operation = PonyParser.formOperation(params,extra)		
		result = operation.call.body[:get_rate_response]
		if result[:tariff]=="0"||result[:error_code]!="0"
			return [nil,nil]
		end
		[result[:tariff_including_vat],result[:delivery_days]]
	end

	#подготавливаем savon operation по wsdl от пони
	def self.formOperation(params,extra)
		client = Savon.new("#{Rails.root}/lib/pony/tariff_ws.wsdl")
		service_name = "PonyRatesService"
		port_name = "PonyRatesPort"
		operation_name = :getRate
		# direction равно 3, если по городу и 2, если между (1 - международная)
		direction = params[:from]==params[:to]?3:2 
		
		operation = client.operation(service_name, port_name, operation_name)
		operation.body = {:getRateRequest=>{:org_city=>params[:city_from],
											:dest_city=>params[:city_to],
											:item_count=>1,
											:weight=>params[:weight],
											:direction=>direction,
											:delivery_mode=>extra[0].to_i}}
		operation
	end

end
