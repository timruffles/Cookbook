class User < ActiveRecord::Base
  
  has_many :todos
  acts_as_follower

  def things_done
    done = []
    done += self.all_follows
    done += self.todos(:conditions => "completed_date IS NOT NULL AND completed_date != ''")
    
    done.sort do |a,b|
      if a.updated_at == b.updated_at
        0
      else
        # trying to get descending from most recent to oldest, works with '<' but shouldn't this be the biggest date? *confused*
        # works that way on a Time object... uh...
        a.updated_at < b.updated_at ? 1 : -1
      end
    end
  end
  
  # has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :micro => "40x40#" }
  
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :confirmable, :lockable, :timeoutable and :activatable
  devise :registerable, :authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :lazily_registered_date
  
  # remove all lazily created users
  def clean_up_lazy_creations
    
  end
  
end
