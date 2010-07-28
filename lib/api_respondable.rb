module ApiRespondable
  
  def api_operation
    
    success = true

    begin
      
      yield

    rescue Exception => e
      success = false
    end
    
    respond_to do |format|
      format.json { success }
      format.html { redirect_to :back, :notice => "Your operation was #{'un' unless success}successful"}
    end
    
  end
  
end