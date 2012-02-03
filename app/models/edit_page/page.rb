module EditPage
  class Page < ActiveRecord::Base
    #TODO: Validates uniqueness of (title + (active = true))
    validates :title, :uniqueness => true, :presence => true
    
    def active?
      self.active == true
    end
  end
end
