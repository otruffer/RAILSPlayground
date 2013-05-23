class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id
  
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates :content, :presence => true
  validates :user, :presence => true
  
  has_many :comments, :dependent => :destroy
  belongs_to :user
end
