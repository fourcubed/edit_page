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
        redirect_to pages_path
      else
        render :action => :edit
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
      Rails.logger.debug("\n\n\n@page = #{@page.inspect}\n\n\n")
      if @page.update_attributes(params[:page])
        Rails.logger.debug("\n\n\nSUCCESS! @page = #{@page.inspect}\n\n\n")
        redirect_to @page
      else
        render :action => :edit
      end
    end
    
    def destroy
      @page = Page.find(params[:id])
      @page.active = false
      @page.save!
      redirect_to pages_path
    end

  end
end
