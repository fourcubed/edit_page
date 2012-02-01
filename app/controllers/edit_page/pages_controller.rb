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
      if @page.save
        redirect_to @page
      else
        render :action => :edit
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
      if @page.update_attributes(params[:page])
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
