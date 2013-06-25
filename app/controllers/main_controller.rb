class MainController < ApplicationController
	def index
		#Достаём все возможные варианты доставки из БД
		@deliveries = Delivery.all
		@providersQuote = []
		#Добавляем в @providersQuote результаты всех парсеров. Имя парсера из БД
		@deliveries.each do |delivery|
			begin
				@parserResult = DeliveryParser.new(delivery.name.constantize)
				@providersQuote << @parserResult
			rescue Exception => msg
				puts msg
			end
		end 

    end
end
