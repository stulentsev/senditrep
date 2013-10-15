class UpsParser

	require 'net/http'
	def self.quotes(params,extra)
		quote = Quote.new()
		quote.companyName = 'UPS'
		quote.price, quote.time = UpsParser.definePriceAndTime(params,extra)
		quote
	end


	private

	def self.definePriceAndTime(params,extra)
		[nil,nil]
	end
end