require 'spec_helper'

describe "Given a new app" do
  before(:each) do
    @app = App.new
  end
  
  it "#app_name should be My Wonderful Rails App" do
    @app.app_name.should == "My Wonderful Rails App"
  end
end
