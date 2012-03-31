module EditPage
  class PagesController < ApplicationController
    
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
        redirect_to pages_path
      else
        render :action => :new
      end
    end
  
    def edit
      @page = Page.find(params[:id])
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
      if @page.update_attributes(params[:page])
        flash.now[:notice] = "Successfully updated page!"
        redirect_to @page
      else
        render :action => :edit
      end
    end
    
    def destroy
      @page = Page.find(params[:id])
      @page.destroy
      flash.now[:notice] = "Successfully deleted page."
      redirect_to pages_path
    end
  end
end
