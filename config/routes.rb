Rails.application.routes.draw do
  root 'pages#home'
  resources 'volunteers'
  resources 'groups' do 
    get 'events'
  end
  get 'events/bulk', to: 'events#bulk'
  post 'events/bulk_create', to: 'events#bulk_create'
  get 'events/list', to: 'events#list'
  resources 'events' do
    post 'status'
  end
  resources 'shifts'
end
