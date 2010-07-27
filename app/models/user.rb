class User < ActiveRecord::Base
  
  has_many :todos
  acts_as_follower
  
  # has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :micro => "40x40#" }
  
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :lazily_registered_date
  
  # remove all lazily created users
  def clean_up_lazy_creations
    
  end
  
end
