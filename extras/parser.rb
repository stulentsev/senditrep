class DeliveryParser
  def initialize(parser)
  	@parser = parser
  end

  def quotes(params)
  	@parser.quotes(params)
  end
end

class Quote
	attr_accessor :price, :time, :companyName
end

