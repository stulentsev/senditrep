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

    	quote = collect_quote(params,params[:delivery_id])
    	if quote.nil? || quote.price.nil?
    		render json:{
    			:code => false
    		}
    	else
	    	render json: { 
	    		:code => true,
	    		:company_name => quote.company_name,
	    		:company_link => quote.company_link,
	    		:type_name => quote.type_name, 
	    		:price => quote.price,
	    		:image_url => quote.image_url,
	    		:days => quote.time
	    	} 
	    end
    end

    private
		def collect_quote(params,delivery_id)
			delivery = Delivery.find(delivery_id)
			begin
				parser_entity = DeliveryParser.new(delivery.name.constantize)
				parser_result = parser_entity.quotes(params,
										[delivery.extra2,delivery.extra3])
				parser_result.type_name = delivery.extra1
				parser_result.company_link = delivery.website
				parser_result.image_url = delivery.image_url
			rescue Exception => msg
				Rails.logger.info "Message"
				Rails.logger.info msg
				parser_result = nil;
			end
			parser_result
		end

		def params_validation()
			params[:city_from], params[:region_from], 
					params[:index_from] = City.parse_address(params[:from])
			params[:city_to], params[:region_to], 
					params[:index_to] = City.parse_address(params[:to])
	    	params[:weight] = params[:weight].gsub(",",".").to_f
	    	params[:height] = params[:height].gsub(",",".").to_f
	    	params[:width] = params[:width].gsub(",",".").to_f
	    	params[:length] = params[:length].gsub(",",".").to_f
	    end
end
