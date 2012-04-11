module EditPage
  class PagesController < ApplicationController
    layout nil
    
    def index
      @pages = Page.where(:active => true)
    end
    
    def new
      @page = Page.new(params[:page])
    end
    
    def create
      @page = Page.new(params[:page])
      if params[:file]
        @page.file_uploads.build(params[:file])
        upload = @page.file_uploads.last
        file_type = upload.upload_content_type.split('/').first
        tag = case file_type
          when "image"; "<img src='#{upload.upload.url}' alt='#{upload.upload_file_name.split(".").first}'>"
          else "<a href='#{upload.upload.url}'>#{upload.upload_file_name}</a>"
        end
        @page.content.insert(0, tag)
      end
      if @page.save
        flash.now[:notice] = "Successfully created page!"
        respond_to do |format|
          format.html { redirect_to pages_path }
          format.js
        end
      else
        @errors = format_errors
        respond_to do |format|
          format.html { render :action => :new }
          format.js { render 'edit_page/pages/failure' }
        end
      end
    end
  
    def edit
      @page = Page.find(params[:id])
      respond_to do |format|
        format.html
        format.js
      end
    end
    
    def show
      @page = Page.find(params[:id])
    end
    
    def update
      @page = Page.find(params[:id])
      if params[:file]
        @page.file_uploads.build(params[:file])
        upload = @page.file_uploads.last
        file_type = upload.upload_content_type.split('/').first
        params[:page]['content'] = case file_type
          when "image"; "<img src='#{upload.last.upload.url}' alt='#{upload.last.upload_file_name.split(".").first}'>" + params[:page]['content']
          else "<a href='#{upload.upload.url}'>#{upload.upload_file_name}</a>" + params[:page]['content']
        end['content']
      end
      if @page.update_attributes(params[:page])
        flash.now[:notice] = "Successfully updated page!"
        respond_to do |format|
          format.html { redirect_to @page }
          format.js
        end
      else
        @errors = format_errors
        respond_to do |format|
          format.html { render :action => :edit }
          format.js { render 'edit_page/pages/failure' }
        end
      end
    end
    
    def destroy
      @page = Page.find(params[:id])
      @page.destroy
      flash.now[:notice] = "Successfully deleted page."
      respond_to do |format|
        format.html { redirect_to pages_path }
        format.js
      end
    end
    
    def format_errors
      string = "<ul>"
      @page.errors.full_messages.each do |error|
        string << "<li>#{error}</li>"
      end
      string << "</ul>"
    end

  end
end
