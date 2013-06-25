class DeliveryParser
  def initialize(parser)
  	@parser = parser
  end

  def quotes
  	@parser.quotes
  end
end

class Quote
	attr_accessor :price, :time
end

