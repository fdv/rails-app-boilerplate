class ApplicationController < ActionController::Base
  protect_from_forgery
  add_breadcrumb :index, :root_path  
  
  def params
    @app ||= App.default
  end
  
end
