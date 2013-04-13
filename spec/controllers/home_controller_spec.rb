require 'spec_helper'

describe HomeController do
  render_views
  
  before :each do
    @app = App.create
  end
  
  it "Should use the index template" do
    get :index
    response.should render_template 'index'
    response.should have_selector('a', :class => 'brand', :content => "My Wonderful Rails App")
  end
    
  it "should use the App name by default as a title" do
    get :index
    response.should render_template 'index'
    response.should have_selector('a', :class => 'brand', :content => "My Wonderful Rails App")
  end
  
  it "changing app name should change the title" do
    @app.app_name = "Come get some"
    @app.save
    get :index
    response.should render_template 'index'
    response.should have_selector('a', :class => 'brand', :content => "Come get some")
  end
    
  describe "With a logged out user" do
    before do
      @user = FactoryGirl.create(:user)
    end
    
    before :each do
      sign_out @user
      get :index
    end

    it "should have login and register links" do
      response.should have_selector('a', :href => "/signup", :content => "Create an account")
      response.should have_selector('a', :href => "/login", :content => "Sign in")    
    end
    
    it "should not have a logout link" do
      response.should_not have_selector('a', :href => "/logout", :content => "Logout")
    end
  end

  describe "With a logged in user" do
    before do
      @user = FactoryGirl.create(:user)
    end
    
    before :each do 
      sign_in @user
      get :index
    end

    it "should not have login and register links" do
      response.should_not have_selector('a', :href => "/signup", :content => "Create an account")
      response.should_not have_selector('a', :href => "/login", :content => "Sign in")    
    end
    
    it "should have a logout link" do
      response.should have_selector('a', :href => "/logout", :content => "Logout")
    end
  end
end
