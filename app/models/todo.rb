class Todo < ActiveRecord::Base
  
  UNSTARTED = 0
  TODO      = 1
  DONE      = 2

  belongs_to :user
  belongs_to :step
  
end
