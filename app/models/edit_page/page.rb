module EditPage
  class Page < ActiveRecord::Base
    has_many :file_uploads, :as => :file
    validates :title, :uniqueness => true, :presence => true
    validates :slug, :uniqueness => true, :presence => { :message => "URL can't be blank" }, :format => { :with => /\w|-/, :on => :create, :message => "URL is invalid" }
    
    def active?
      self.active == true
    end
  end
end