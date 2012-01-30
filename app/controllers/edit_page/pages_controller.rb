module EditPage
  class PagesController < ApplicationController
    def index
      @pages = Page.all
    end
    
    def create
      @page = Page.new(params[:page])
      if @page.save
        redirect_to url_for(:controller => 'edit_page/pages', :action => 'show', :id => @page.id)
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
    
  end
end
