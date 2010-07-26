# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  layout 'application'
  
  before_filter :lazy_registration
  
  
  protected
    
    # creates a user model if one is not present to allow
    # unregistered users to use the app
    def lazy_registration
      unless user_signed_in? || chef_signed_in?
        user = User.create :lazily_registered_date => Time.now, :password => 'password', :password_confirmation => 'password', :email => "lazy#{rand(9999)}@lazy#{rand(9999)}.com"
        sign_in(user)
      end
    end
      

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end