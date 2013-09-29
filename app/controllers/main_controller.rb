class MainController < ApplicationController
	
	def index
		if !(params[:from].blank?||params[:to].blank?)#не выполняем блок при первичной загрузке
			#Достаём все возможные варианты доставки из БД
			@providersQuote = collectQuotes(params)
		end

		respond_to do |format|
			format.html
			format.js
		end
    end

    def result
    	render :layout => false
    end

    private

    	def collectQuotes(params)
    		deliveries = Delivery.all
			providersQuote = []
			#Добавляем в @providersQuote результаты всех парсеров. Имя парсера из БД
			deliveries.each do |delivery|
				begin
					parserEntity = DeliveryParser.new(delivery.name.constantize)
					parserResult = parserEntity.quotes(params,
											[delivery.extra2,delivery.extra3])
					parserResult.typeName = delivery.extra1
					parserResult.companyLink = delivery.website
					providersQuote << parserResult
				rescue Exception => msg
					Rails.logger.info "Message"
					Rails.logger.info msg
				end
			end
			providersQuote
		end
end
