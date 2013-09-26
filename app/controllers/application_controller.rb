class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :reload_libs if Rails.env.development?
  before_filter :define_bottom_links
  
  private
  
  def reload_libs
    Dir["#{Rails.root}/extras/*.rb"].each { |path| require_dependency path }
  end

  def define_bottom_links  	
  	@pages = Page.all
  end
end
