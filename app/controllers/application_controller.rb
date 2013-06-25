class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :reload_libs if Rails.env.development?
  
  private
  
  def reload_libs
    Dir["#{Rails.root}/extras/*.rb"].each { |path| require_dependency path }
  end

end
