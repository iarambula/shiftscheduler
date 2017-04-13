Rails.application.routes.draw do
  root 'pages#home'
  resources 'volunteers'
  resources 'groups'
  resources 'events'
  resources 'shifts'
end
