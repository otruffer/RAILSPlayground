class Tag < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, :presence => true
  validates :name, :length => {:maximum => 15}
end
