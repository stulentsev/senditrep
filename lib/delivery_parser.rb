class DeliveryParser
  def initialize(parser)
  	@parser = parser
  end

  def quotes(params,extra)
  	@parser.quotes(params,extra)
  end
end

class Quote
	attr_accessor :price, :time, :company_name, :type_name, :company_link,:image_url
end

