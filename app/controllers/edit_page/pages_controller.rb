module EditPage
  class PagesController < ApplicationController
    def index
      @pages = Page.where(:active => true)
    end
    
    def create
      @page = Page.new(params[:page])
      @old_page = Page.find(params[:page][:id])
      if @page.save
        @old_page.active = false
        @old_page.save!
        @page.activate!
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
