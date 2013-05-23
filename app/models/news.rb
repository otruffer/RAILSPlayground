class News < ActiveRecord::Base
  attr_accessible :content, :user
  validates :content, :presence => true, :length => {:maximum => 10}
end
