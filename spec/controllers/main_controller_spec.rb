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
		it "gives request from ems"
		it "gives request from dpd"
		it "gives request from pony"
		it "gives request from ups"
		it "gives request from cdek"
	end
end