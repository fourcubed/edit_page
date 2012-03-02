module EditPage
  class Page < ActiveRecord::Base
    has_many :file_uploads, :as => :file
    validates :title, :uniqueness => true, :presence => true
    validates :slug, :uniqueness => true, :presence => true, :format => {:with => /\w|-/}
    
    def active?
      self.active == true
    end
  end
end