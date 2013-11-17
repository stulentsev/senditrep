FactoryGirl.define do
	factory :delivery do |f|
		f.website "Http://delivery.com"
		f.image_url "delivery.jpg"
		f.extra1 "Express"
		f.extra2 ""
		f.extra3 ""
	end
	factory :delivery_params, class:Hash do
		delivery_id "1"
		city_from "москва"
		city_to "москва"
		index_from "101000"
		index_to "101000"
		weight "3"
		length ""
		width ""
		height ""
		initialize_with {attributes}
	end 

	factory :ems, parent: :delivery do
		name "EmsParser"
	end

	factory :dpd, parent: :delivery do
		name "DpdParser"
		extra2 "ECN"
	end

	factory :pony, parent: :delivery do
		name "PonyParser"
		extra2 "2"
	end

	factory :ups, parent: :delivery do
		name "UpsParser"
	end


	factory :cdek, parent: :delivery do
		name "CdekParser"
		extra2 "1"
	end
end