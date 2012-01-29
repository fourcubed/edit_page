class CreateEditPagePages < ActiveRecord::Migration
  def change
    create_table :edit_page_pages do |t|
      t.string :title, :limit => 255
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
