#encoding:utf-8
class CdekParser
	
	require 'net/http'
  	require 'json'
	
	#return data as instance of Quote class
	def self.quotes(params,extra)		
		quote = Quote.new()
		quote.companyName = 'СДЭК'
		quote.price, quote.time =[200,2]#CdekParser.definePriceAndTime(params,extra)
		quote
	end

	#defining the price and time by parameters
	def self.definePriceAndTime(params,extra)
		
		uri = URI.parse(
			"http://api.edostavka.ru/calculator/calculate_price_by_json.php")
		body = CdekParser.formBody(params,extra)


		request = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' =>'application/json'})
		request.body = body
		response = Net::HTTP.new(uri.host, uri.port).start {|http| http.request(request) }		
  		result = JSON.parse(response.body)

		[result["result"]["price"],result["result"]["deliveryPeriodMax"]]
	end

	def self.formBody(params,extra)
		senderCityId = CdekLocation.find_by_cityname(
						params[:city_from].mb_chars.downcase).num.to_s
		receiverCityId = CdekLocation.find_by_cityname(
						params[:city_to].mb_chars.downcase).num.to_s

		body = { 
			"version"=>"1.0",
			"senderCityId"=>senderCityId, 
			"receiverCityId"=>receiverCityId, 
			"tariffId"=>extra[0], 
			"goods"=>	
				[ 
					
					{ 
						"weight"=>params[:weight], 
						"volume"=>"0.001" 
					} 
				] 
		}.to_json
		body
	end
end