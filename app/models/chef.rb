class Chef < ActiveRecord::Base
  
  has_many :recipes
  
  accepts_nested_attributes_for :recipes
  
  # ARRRRRRRRG! - make sure everything is listed here, included all nested attributes
  attr_accessible :name, :profile, :tag_line, :website, :profile_img, :twitter, :linkedin, :facebook, :recipes_attributes 
  
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
end
