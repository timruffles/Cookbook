class UsersController <  LazyController
  
  skip_before_filter :lazy_registration, :only => :sign_in_force
  
  def show
    @user = User.find(params[:id])
    @activity = @user.things_done
  end
  
  def sign_in_force
    sign_out(current_user)
    redirect_to new_user_session_path
  end
  
  # GET /users/claim
  # 
  def claim
    current_user.email = ''
  end
  
  # POST /users/claimed
  def claimed
    
    if current_user.update_attributes!(params[:user].merge(:lazily_registered_date => ''))
      redirect_to(root_path, :notice => "Thanks, you have successfully claimed your account")
    else
      redirect_to(user_claim, :warning => "Opps, something went wrong. Give it another go or email support@cothink.co.uk")
    end
      
  end
  
  
end