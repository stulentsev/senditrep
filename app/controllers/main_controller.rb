class MainController < ApplicationController
	
	def index
		@delivery_ids = Delivery.all.map{|d| d.id}
		respond_to do |format|
			format.html
			format.js
		end
    end
    

    def quote
    	quote = collectQuote(params,params[:delivery_id])
    	if quote.nil? || quote.price.nil?
    		render json:{
    			:code => false
    		}
    	else
	    	render json: { 
	    		:code => true,
	    		:company => quote.companyName,
	    		:typeName => quote.typeName, 
	    		:price => quote.price,
	    		:days => quote.time
	    	} 
	    end
    end

    private

		def collectQuote(params,delivery_id)
			delivery = Delivery.find(delivery_id)
			begin
				parserEntity = DeliveryParser.new(delivery.name.constantize)
				parserResult = parserEntity.quotes(params,
										[delivery.extra2,delivery.extra3])
				parserResult.typeName = delivery.extra1
				parserResult.companyLink = delivery.website
				
			rescue Exception => msg
				Rails.logger.info "Message"
				Rails.logger.info msg
				parserResult = nil;
			end
			parserResult
		end
end
