require 'spec_helper'

describe FollowsController do
  
  #arg doesn't work :(
   include Devise::TestHelpers
  
  fixtures :users, :recipes
  
  before do
    request.env['warden'] = mock_model(Warden)
  end

  it "should create a follow" do
    
    sign_in(users(:bill))
    
    post :follow_type => :recipe, :recipe_id => recipes(:cake).id
    
    users(:bill).following?(recipes(:cake)).should == true
    
  end
  
  it "should delete follows"
  

end