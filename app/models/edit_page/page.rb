module EditPage
  class Page < ActiveRecord::Base
    has_many :file_uploads, :as => :file, :dependent => :destroy
    validates :title, :uniqueness => true, :presence => true
    validates :relative_url, :uniqueness => true, :presence => true, :format => { :with => /#{URI::REGEXP::PATTERN.const_get(:REL_URI)}/ }
    
    def active?
      self.active == true
    end
  end
end