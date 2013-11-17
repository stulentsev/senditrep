#encoding: utf-8
class SpsrParser
	#include HTTParty
	#format :json
	require "net/http"
	require 'active_support'
	#return data as instance of Quote class
	def self.quotes params,extra 		
		quote = Quote.new()
		quote.company_name = 'SPSR'
		quote.price, quote.days =SpsrParser.define_price_and_time(params)
		quote
	end

	#defining the price and time by parameters
	def self.define_price_and_time(params) 
		resp = SpsrParser.getResponse(params)

		[200,2]
	end

	private
		def self.getResponse(params)
			request_hash = SpsrParser.form_request_hash(params)
			path = SpsrParser.get_path_from_hash('/cgi-bin/postxml.pl', request_hash) 
			result_xml = Net::HTTP.get('cpcr.ru', path)
			result_hash = Hash.from_xml(result_xml)
			puts result_hash
		end

		def self.form_request_hash(params)
			{
				"TariffCompute_2" => "",
				"Country" => "209|0",
				"ToRegion" => "40|0",
				"ToCity" => "992|0",
				"FromCountry" => "209|0",
				"FromRegion" => "35|0",
				"FromCity" => "893|0",
				"Weight" => "1",
				"ToCityName" => "Москва",
				"Nature" => "1",
				"FromCityName"=>"Санкт-Петербург",
				"Amount" => "0",
				"SMS" => "0",
				"BeforeSignal" => "0",
				"PlatType" => "3",
				"DuesOrder" => "0"
			}
		end

		def self.get_path_from_hash(basic_path, request_hash)
			result = basic_path+"?"
			request_hash.each do |key,value|
				result += key
				result += "="+value if !value.empty?
				result += "&"
			end
			result
		end




end
# api_base = "http://www.cpcr.ru/cgi-bin/postxml.pl"
		# api_query = {:query=>
		# 	{				
		# 		:CityName => "Москва"
		# 	}
		# }
		# begin
		# 	response = post(api_base,api_query).parsed_response
		# 	p response
		# rescue Exception=>e 
		# 	puts "Error"
		# 	puts e
		# end
