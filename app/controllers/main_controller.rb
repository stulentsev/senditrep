class MainController < ApplicationController
	
	def index
		@delivery_ids = Delivery.all.map{|d| d.id}
		respond_to do |format|
			format.html
			format.js
		end
    end
    
    def quote
    	params_validation()

    	quote = collectQuote(params,params[:delivery_id])
    	if quote.nil? || quote.price.nil?
    		render json:{
    			:code => false
    		}
    	else
	    	render json: { 
	    		:code => true,
	    		:companyName => quote.companyName,
	    		:companyLink => quote.companyLink,
	    		:typeName => quote.typeName, 
	    		:price => quote.price,
	    		:image_url => quote.image_url,
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
				parserResult.image_url = delivery.image_url
			rescue Exception => msg
				Rails.logger.info "Message"
				Rails.logger.info msg
				parserResult = nil;
			end
			parserResult
		end

		def params_validation()
			params[:city_from], params[:region_from], 
					params[:index_from] = City.parseAddress(params[:from])
			params[:city_to], params[:region_to], 
					params[:index_to] = City.parseAddress(params[:to])
	    	params[:weight] = params[:weight].gsub(",",".").to_f
	    	params[:height] = params[:height].gsub(",",".").to_f
	    	params[:width] = params[:width].gsub(",",".").to_f
	    	params[:length] = params[:length].gsub(",",".").to_f
	    end
end
