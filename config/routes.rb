Rails.application.routes.draw do
  root 'pages#home'
  resources 'volunteers'
  resources 'groups'
  get 'events/bulk', to: 'events#bulk'
  post 'events/bulk_create', to: 'events#bulk_create'
  resources 'events'
  resources 'shifts'
end
