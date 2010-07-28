class Todo < ActiveRecord::Base
  
  include Doable
  
  doable :updated_at, lambda {
    "Completed #{step.text}"
  }

  
  belongs_to :user
  belongs_to :step
  
  named_scope :for, lambda {|user|
    {:conditions => {:user_id => user.id}}
  }
  
  named_scope :completed, {
    :conditions => "completed_date != ''"
  }
  
end