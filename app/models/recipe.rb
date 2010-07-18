class Recipe < ActiveRecord::Base
  
  belongs_to :chef
  has_many   :steps
  
  accepts_nested_attributes_for :steps
  
  
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
  
  def self.find_with_todos(id, user_id = nil)
#    query_hash = {:include => :steps}
    query_hash = {:include => :steps}
#    query_hash.deep_merge!({:include => {:steps => :todos}, :conditions => {:todos => {:user_id => user_id}}}) if user_id
    Recipe.find id, query_hash
  end
  
  
end
