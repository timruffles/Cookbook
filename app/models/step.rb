class Step < ActiveRecord::Base
  
  has_many   :todos
  belongs_to :recipe
  
  named_scope :with_todos_for, lambda {|user|
    user ? {:joins => sprintf('LEFT OUTER JOIN todos ON todos.step_id = steps.id AND todos.user_id = %d', user.id)} : {}
  }
  
  accepts_nested_attributes_for :todos, :reject_if => lambda {|attrs| attrs[:completed_date] == ""}
  
  class << self
    
    @@line_re = /^[\t\s]*\d+\./
  
    # returns a list of steps 
    def from_text(step_text = '')
      steps = []
      step_text.split(@@line_re).each do |part|
        next if part =~ /^[\s\t\r]*$/
      
        # remove all urls, taking the last on as the step
        url = ''
        part.gsub!(/(?:(?:http:\/\/)?(?:www\.)?)(?:[\w_-]*)(?:\.\w+)+\S*/) do |match|
          url = match
          ''
        end
      
        steps << Step.new(:url => url, :text => part.strip)
      end
      steps
    end
    
    def to_text(steps)
      
      count = 1
      text = ''
      steps.each do |step|
        text += "#{count}. #{step.text} #{step.url}\n"
        count += 1
      end
      
      text
    end
    
  end
  
  # returns the first todo, which is normally the only as it's being called in context of current user
  def todo
    todos.first
  end
  
end