class DpdParser
	def self.quotes(params)
		quote = Quote.new()
		quote.companyName = 'DPD'
		quote.price = 200
		quote.time = '3-5 дней'
		quote
	end
end