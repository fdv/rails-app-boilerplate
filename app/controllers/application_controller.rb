class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def params
    @app ||= App.default
  end
  
end
