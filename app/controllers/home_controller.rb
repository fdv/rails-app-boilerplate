class HomeController < ApplicationController
  def index
    @app = App.default
  end
end
