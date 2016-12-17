Rails.application.routes.draw do
  root('tweets#index')
  devise_for(:users)
  resources(:users)

  resources(:tweets) do
    get('full', on: :collection)
  end
end