module EditPage
  class FileUpload < ActiveRecord::Base
    belongs_to :page
    
    validates_attachment_size :upload, :less_than => 3.megabytes, :if => :new_record?
    
    has_attached_file :upload
  end
end
