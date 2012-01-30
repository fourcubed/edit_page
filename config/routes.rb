EditPage::Engine.routes.draw do
  root :to => "pages#index"
  
  match '/pages/:id' => 'pages#show'
  match '/pages/:id/edit' => 'pages#edit'
  match '/pages/' => 'pages#create'

end
