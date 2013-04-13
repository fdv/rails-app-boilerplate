class ApplicationController < ActionController::Base
  protect_from_forgery
  add_breadcrumb :index, :root_path  
  
  def app
    @app ||= App.default
  end
  
end
