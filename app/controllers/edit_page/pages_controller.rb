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
      if @page.save
        flash.now[:notice] = "Successfully created page."
        respond_to do |format|
          format.html { redirect_to pages_path }
          format.js
        end
      else
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
      if @page.update_attributes(params[:page])
        flash.now[:notice] = "Successfully updated page."
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

  end
end
