class MainController < ApplicationController
  def index
    @deliveries = Delivery.all
    @delivery_ids = @deliveries.map{|d| d.id}
    respond_to do |format|
      format.html
      format.js
    end
  end

  def validate_parameters()
    params_validation()
    params_completing()
    render json: params.to_json
  end

  def quote
    quote = collect_quote(params,params[:delivery_id])
    if quote.nil? || quote.price.nil?
      result = {:code => false}
    else
      result = { 
        :code => true,
        :company_name => quote.company_name,
        :company_link => quote.company_link,
        :type_name => quote.type_name, 
        :price => quote.price,
        :image_url => quote.image_url,
        :days => quote.days
      }	    
    end
    render json:result
  end

  private
  def collect_quote(params,delivery_id)
    delivery = Delivery.find(delivery_id)
    begin
      parser_entity = DeliveryParser.new(delivery.name.constantize)
      parser_result = parser_entity.quotes(params,[delivery.extra2,delivery.extra3])
      parser_result.type_name = delivery.extra1
      parser_result.company_link = delivery.website
      parser_result.image_url = delivery.image_url
    rescue Exception => msg # TODO: Never rescue Exception!
      Rails.logger.info "Message"
      Rails.logger.info msg
      parser_result = nil;
    end
    parser_result
  end

  # It's not validation, it's transformation, isn't it?
  def params_validation()
    params[:weight] = params[:weight].gsub(",",".").to_f
    params[:height] = params[:height].gsub(",",".").to_f
    params[:width] = params[:width].gsub(",",".").to_f
    params[:length] = params[:length].gsub(",",".").to_f
  end

  # TODO: Weird method name.
  def params_completing()
    params[:city_from], params[:region_from], 
      params[:index_from] = City.parse_address(params[:from])
    params[:city_to], params[:region_to], 
      params[:index_to] = City.parse_address(params[:to])
    if !params[:isdocument].nil?
      params[:weight] = 0.5
    else
      volume_weight = weight_by_size()
      params[:weight] = volume_weight if (volume_weight > params[:weight])
    end
  end

  def weight_by_size()
    params[:weight]*params[:height]*params[:length]/6000
  end
end
