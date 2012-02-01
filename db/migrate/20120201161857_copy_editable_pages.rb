class CopyEditablePages < ActiveRecord::Migration
  def up
    begin
      # copy pages in Rails.root/lib/edit_page/pages
      Dir.glob(Rails.root.join("lib/edit_page/pages/*.{html,css,js,txt,erb}")).each do |file|
        page = EditPage::Page.new(:title => file.split('/').last, :content => File.read(file))
        page.save!
      end
    rescue
      puts "Please add your editable files to lib/edit_page/pages/"
    end
  end

  def down
  end
end
