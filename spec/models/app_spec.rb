require 'spec_helper'

describe App do
  it "accepts a settings field in its parameter hash" do
    App.new({"app_name" => 'My cool app'})
  end

  describe "Given no app, a new default app" do
    before :each do
      @app = App.new
    end

    it "should be valid after filling the title" do
      @app.app_name = "something not empty"
      @app.should be_valid
    end

    it "should be valid without filling the title" do
      @app.app_name.should == "My Wonderful Rails App"
      @app.should be_valid
    end

    it "should not be valid after setting an empty title" do
      @app.app_name = ""
      @app.should_not be_valid
    end
  end

end

