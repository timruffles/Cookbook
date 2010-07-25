class Recipe < ActiveRecord::Base
  
  belongs_to :chef
  has_many   :steps
  
  accepts_nested_attributes_for :steps
  
  default_scope :include => [{:chef => :recipes}, :steps]
  
  named_scope :with_chefs_recipes, :include => :chef
  named_scope :with_todos_for, lambda {|user|
    user ? {:include => {:steps => :todos}, :conditions => {:todos => {:user_id => user.id}}} :
           {:include => :steps}
  }
  
  alias :old_initialize :initialize
  
  ## alert! this doesn't work with some stuff like find_or_create as initialize is never called :(
  ## this cost me an afternoon of tracking down fking rails magic
  def initialize params = nil
    step_str = params.delete(:steps) if params && String === params[:steps]
    old_initialize(params)
    if step_str
      self.steps = Step.parse(step_str)
    end
  end
  
  
end
