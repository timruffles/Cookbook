module RecipesHelper
  def prepare_step(step)
    step.todos.build :user => current_user
  end
end
