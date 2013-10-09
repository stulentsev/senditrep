#encoding: utf-8
class DhlParser
	def self.quotes(params)		
		quote = Quote.new()
		quote.companyName = 'DHL'
		quote.price, quote.time = [200, '1-2']
		quote
	end
end