class CreateEditPagePages < ActiveRecord::Migration
  def change
    create_table :edit_page_pages do |t|
      t.string :title, :limit => 255
      t.text :content
      t.string :file_name, :limit => 255
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
