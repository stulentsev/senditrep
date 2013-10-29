class EmsParser
	include HTTParty
	format :json
	  
	#return data as instance of Quote class
	def self.quotes(params,extra)		
		quote = Quote.new()
		quote.companyName = 'EMS'
		quote.price, quote.time =[200,2]#EmsParser.definePriceAndTime(params)
		quote
	end

	#defining the price and time by parameters
	def self.definePriceAndTime(params)
		resp = EmsParser.getResponse(params)
		if resp['rsp']['stat'] = 'ok'
			return [resp['rsp']['price'],resp['rsp']['term']['max']]
		else
			return [nil,nil]
		end
	end

	#form a response from EMS API
	def self.getResponse(params)
		apiSite = 'http://emspost.ru/api/rest'
		apiQuery = {:query => 
			{:method => 'ems.calculate',
				:from => Emslocation.locationCode(params[:city_from]),
				:to => Emslocation.locationCode(params[:city_to]),
				:weight=>params[:weight]}}
		resp = get(apiSite,apiQuery).parsed_response
		resp
	end
end