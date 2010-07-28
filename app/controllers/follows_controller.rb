class FollowsController < LazyController
  
  include ApiRespondable
  
  def create
    
    api_operation do
      
      followable = params[:follow][:followable_type].classify.constantize.find(params[:follow][:followable_id])
      current_user.follow(followable)
      
    end

  end
  
  def destroy
    
    api_operation do
      followable = params[:follow][:followable_type].classify.constantize.find(params[:follow][:followable_id])
      
      # TODO stop unfollowing a Recipe if it has completed todos?
      # if Recipe === followable
      #        current_user.stop_following(followable) if followable.todos.for(current_user).length == 0
      #      else
        current_user.stop_following(followable)
      # end
      
    end
    
  end
  
end