class App < ActiveRecord::Base
  # attr_accessible :title, :body
  include ConfigManager
  validates :app_name, :presence => true
  
  validate(:on => :create) { |blog|
    unless App.count.zero?
      app.errors.add(:base, "There can only be one...")
    end
  }
  
  serialize :settings, Hash

  setting :app_name,                  :string, 'My Wonderful Rails App'
    
  def self.default
    find(:first, :order => 'id')
  end
end
