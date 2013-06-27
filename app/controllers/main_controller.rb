class MainController < ApplicationController

	def index
		
		@someVar = "Hello"
		#Достаём все возможные варианты доставки из БД
		@deliveries = Delivery.all
		@providersQuote = []
		#Добавляем в @providersQuote результаты всех парсеров. Имя парсера из БД
		@deliveries.each do |delivery|
			begin
				@parserEntity = DeliveryParser.new(delivery.name.constantize)
				@parserResult = @parserEntity.quotes(params)
				@providersQuote << @parserResult
			rescue Exception => msg
				Rails.logger.info "Message"
				Rails.logger.info msg
			end
		end 
    end
end
