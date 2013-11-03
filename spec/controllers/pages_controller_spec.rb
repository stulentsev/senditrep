require 'spec_helper'

describe PagesController do
	describe "index" do
		it "assigns all pages" do
			page1 = FactoryGirl.create(:page)
			page2 = FactoryGirl.create(:page)
			get :index
			assigns(:pages).should == [page1, page2]
		end
	end

	describe "show" do
		it "displays right page" do 
			page1 = FactoryGirl.create(:page)
			page2 = FactoryGirl.create(:page)
			get :show, id: page2.id
			assigns(:page).should == page2
		end
	end
end