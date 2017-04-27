Rails.application.routes.draw do
  root 'pages#home'
  resources 'volunteers'
  resources 'groups' do 
    get 'events'
  end
  get 'events/bulk', to: 'events#bulk'
  post 'events/bulk_create', to: 'events#bulk_create'
  resources 'events' do
    post 'confirm'
  end
  resources 'shifts'
end
