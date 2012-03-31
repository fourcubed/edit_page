class CreateEditPageFileUploads < ActiveRecord::Migration
  def change
    create_table :edit_page_file_uploads do |t|
      t.string :upload_file_name
      t.string :upload_content_type
      t.integer :upload_file_size
      t.datetime :upload_updated_at
      
      t.string :file_type, :limit => 255
      t.integer :file_id

      t.timestamps
    end
  end
end
