class ChefsController < LazyController
  
  def show
    
    @chef = Chef.find(params[:id])
    
  end
  
end