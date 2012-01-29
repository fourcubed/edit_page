module EditPage
  class PagesController < ApplicationController
    def index
      @pages = Page.all
    end
  
    def edit
    end
    
    def show
    end
    
    def destroy
    end
  
  end
end
