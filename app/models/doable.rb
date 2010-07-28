# simple mixin that makes a model something 'done', exposing a did what and did when interface for activity streams
module Doable
  
  def self.included into
    into.class_eval do 
      class << self
        include Doable::ClassMethods
      end
    end
  end
  
  module ClassMethods
    
    def doable when_proc_or_sym, what_proc
      
      when_proc = if(Symbol === when_proc_or_sym)
                    lambda {
                      self.send when_proc_or_sym #what_proc_or_sym
                    }
                  else
                    when_proc_or_sym
                  end
                 
      define_method :did_what, &what_proc
      define_method :did_when, &when_proc
      
    end
    
  end
  
  
  def did_what
    
  end
  
  def did_when
    
  end
  
end