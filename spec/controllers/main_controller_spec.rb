require 'spec_helper'

describe MainController do
	
	describe "main page" do
		it "render the index template" do
			get :index
			expect(response).to render_template("index")
		end

		it "assigns delivery id" do
			delivery = FactoryGirl.create(:delivery)
			get :index
			assigns(:delivery_ids).should eq [delivery.id]
		end

		it "assigns pages for the footer" do
			page = FactoryGirl.create(:page)
			get :index
			assigns(:pages).should eq [page]
		end
	end

	describe "quote requests" do
		before :all do 
			city = FactoryGirl.create(:city)
			city.indices.create(city_index:"101000")
		end

		it "gives request from ems" do
			FactoryGirl.create(:emslocation)
			delivery = FactoryGirl.create(:ems)
			parameters = FactoryGirl.build(:delivery_params, delivery_id:delivery.id)
			post :quote, parameters

			parsed_body = JSON.parse(response.body)
			parsed_body["code"].should == true
		end
		it "gives request from dpd" do
			delivery = FactoryGirl.create(:dpd)
			parameters = FactoryGirl.build(:delivery_params, delivery_id:delivery.id)

			post :quote, parameters

			parsed_body = JSON.parse(response.body)
			parsed_body["code"].should == true
		end

		it "gives request from pony" do
			delivery = FactoryGirl.create(:pony)
			parameters = FactoryGirl.build(:delivery_params, delivery_id:delivery.id)

			post :quote, parameters

			parsed_body = JSON.parse(response.body)
			parsed_body["code"].should == true
		end
		it "gives request from ups" do 
			delivery = FactoryGirl.create(:ups)
			parameters = FactoryGirl.build(:delivery_params, delivery_id:delivery.id)

			post :quote, parameters

			parsed_body = JSON.parse(response.body)
			parsed_body["code"].should == true
		end
		it "gives request from cdek" do
			delivery = FactoryGirl.create(:cdek)
			FactoryGirl.create(:cdek_location)
			parameters = FactoryGirl.build(:delivery_params, delivery_id:delivery.id)

			post :quote, parameters

			parsed_body = JSON.parse(response.body)
			parsed_body["code"].should == true
		end
	end
end