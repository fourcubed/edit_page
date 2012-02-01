Rails.application.routes.draw do

  mount EditPage::Engine => "/edit_page"
  
  match 'pages/:title' => 'pages#show'
end
