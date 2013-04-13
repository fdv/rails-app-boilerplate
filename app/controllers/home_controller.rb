class HomeController < ApplicationController
  def index
    app = App.default
    app.save
  end
end
