class App < ActiveRecord::Base
  # attr_accessible :title, :body
  include ConfigManager
  validates :app_name, :presence => true
  
  serialize :settings, Hash

  setting :app_name,                  :string, 'My Cool App!'
    
  def self.default
    find(:first, :order => 'id')
  end
end
