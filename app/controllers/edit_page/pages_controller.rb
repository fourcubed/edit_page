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
        @page.content.insert(0, "<img src='#{@page.file_uploads.last.upload.url}' alt='#{@page.file_uploads.last.upload_file_name.split(".").first}'>")
      end
      if @page.save
        flash.now[:notice] = "Successfully created page!"
        respond_to do |format|
          format.html { redirect_to pages_path }
          format.js
        end
      else
        @errors = format_errors
        Rails.logger.debug("\n\n\n@errors = #{@errors}\n\n\n")
        Rails.logger.debug("\n\n\nerrors = #{@page.errors.full_messages}\n\n\n")
        respond_to do |format|
          format.html
          format.js
        end
        render :action => :new
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
        params[:page]['content'] = "<img src='#{@page.file_uploads.last.upload.url}' alt='#{@page.file_uploads.last.upload_file_name.split(".").first}'>" + params[:page]['content']
      end
      if @page.update_attributes!(params[:page])
        flash.now[:notice] = "Successfully updated page!"
        respond_to do |format|
          format.html { redirect_to @page }
          format.js
        end
      else
        render :action => :edit
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
