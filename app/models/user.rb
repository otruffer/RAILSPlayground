class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :cerevis, :first_name, :last_name
  
  validates :email, :presence => true, :uniqueness => true
  validates :cerevis, :length => {:maximum => 30, :minimum => 0}

  has_many :posts, :dependent => :destroy;
  has_many :comments, :dependent => :destroy;
end
