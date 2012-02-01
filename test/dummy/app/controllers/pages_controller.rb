class PagesController < ApplicationController
  def show
    @page = EditPage::Page.find_by_title(params[:title])
    render :text => @page.content
  end
end