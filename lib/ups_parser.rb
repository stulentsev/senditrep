class UpsParser
	require 'net/http'
	require 'net/https'
	#require 'active_shipping'
	#include ActiveMerchant::Shipping

	def self.quotes(params,extra)
		quote = Quote.new()
		quote.companyName = 'UPS'
		quote.price, quote.time = UpsParser.definePriceAndTime(params,extra)
		quote
	end


	private

	def self.definePriceAndTime(params,extra)
		#forming a request to UPS server
		#header for auth
		header = UpsParser.form_header()
		#body of request
		body = UpsParser.form_body(params)
		request = header.to_xml + body.to_xml
		#puts request
		
		#parse the url
		ups_url = "https://onlinetools.ups.com/ups.app/xml/Rate"
		uri = URI.parse(ups_url)

		#POST request
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		headers = {'Content-Type'=> 'application/x-www-form-urlencoded'}
		begin
			resp = http.post(uri.path, request, headers).body
			resp_xml = Nokogiri::XML.parse(resp)
			if resp_xml.xpath("//ResponseStatusCode").text == "1"
				price = resp_xml.xpath("//TotalCharges//MonetaryValue").first.text
				days = resp_xml.xpath("//GuaranteedDaysToDelivery").first.text
				return [price,days]
			end
		rescue => e
			puts e
		end
		[nil,nil]
	end


	def self.form_header()
		Nokogiri::XML::Builder.new do |xml|
			xml.AccessRequest(xml:lang="en-US") {
			  xml.AccessLicenseNumber ENV["UPS_KEY"]
			  xml.UserId ENV["UPS_LOGIN"]
			  xml.Password ENV["UPS_PASSWORD"]
			}
		end
	end

	def self.form_body(params)
		p params[:index_from].to_s
		Nokogiri::XML::Builder.new do |xml|
			xml.RatingServiceSelectionRequest(xml:lang="en-US") {
			  xml.Request{
			  	xml.TransactionReference{
			  		xml.CustomerContext "Rating and Service"
			  		xml.XpciVersion "1.0"
			  	}
			  	xml.RequestAction "Rate"
			  	xml.RequestOption "Rate"
			  }
			  xml.PickupType{
			  	xml.Code "06"
			  	xml.Description "Rate"
			  }
			  xml.Shipment{
			  	xml.Description "Rate Description"
			  	xml.Shipper{
			  		xml.Name "SendIt"
			  		xml.PhoneNumber "79266060314"
			  		xml.Address{
			  			xml.PostalCode "101000"
			  			xml.CountryCode "RU"
			  		}
			  	}
			  	xml.ShipTo{
			  		xml.CompanyName "Company"
			  		xml.PhoneNumber "79266060314"
			  		xml.Address{
			  			xml.PostalCode params[:index_to]
			  			xml.CountryCode "RU"
			  		}
			  	}
			  	xml.ShipFrom{
			  		xml.CompanyName "Second Company"
			  		xml.PhoneNumber "79266060314"
			  		xml.Address{
			  			xml.PostalCode params[:index_from]
			  			xml.CountryCode "RU"
			  		}
			  	}
			  	xml.Service{
			  		xml.Code "65"
			  	}

			  	xml.Package{
			  		xml.PackagingType{
			  			xml.Code "00"
			  			xml.Description "UNKNOWN"
			  		}
			  		xml.Description "Rate"
			  		xml.PackageWeight{
			  			xml.UnitOfMeasurement{
			  				xml.Code "KGS"
			  			}
			  			xml.Weight params[:weight]
			  		}
			  	}
			  	xml.ShipmentServiceOptions{

			  	}
			  }
			}
		end
	end
end
