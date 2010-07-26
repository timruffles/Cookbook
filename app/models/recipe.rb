class Recipe < ActiveRecord::Base
  
  belongs_to :chef
  has_many   :steps
  
  accepts_nested_attributes_for :steps
  
  default_scope :include => [:chef, :steps]
  
  named_scope :with_chefs_recipes, :include => {:chef => :recipes}
  named_scope :with_todos_for, lambda {|user|
    user ? {:joins => sprintf('LEFT OUTER JOIN steps ON recipes.id = steps.recipe_id LEFT OUTER JOIN todos ON todos.step_id = steps.id AND todos.user_id = %d', user.id)} : {}
  }
  
  def steps_as_text= text
    self.steps = Step.from_text(text)
  end
  
  def steps_as_text
    Step.to_text(self.steps)
  end
  
end
