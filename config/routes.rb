Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  scope '(:locale)', locale: /es|en/ do
    # You can have the root of your site routed with "root"
    authenticated :user do |variable|
        root 'welcome#index', as: :authenticated_root
    end
    root to: redirect('/users/sign_in')

    devise_for :users

    # The priority is based upon order of creation: first created -> highest priority.
    # See how all your routes lay out with "rake routes".

    # Example of regular route:
    #   get 'products/:id' => 'catalog#view'

    get 'stories/:id' => 'stories#show', as: :story

    concern :followable do
        member do
            get :follow
            get :unfollow
        end
    end

    concern :trashable do
        member do
            get :like
            get :dislike
        end
    end

    resources :legislatives, only: [:index, :show] do
        concerns [:followable, :trashable]
        collection do
            get :events
            get :favorites
            get :trash
            get :stakeholders
            get 'stakeholder/:id', action: :stakeholder, as: :stakeholder
        end
    end

    resources :legislative_users, only: [:create, :update]

    resources :executives, only: [:index, :show] do
        concerns :followable
        collection do
            get :favorites
        end
    end


    # Example of named route that can be invoked with purchase_url(id: product.id)
    #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

    # Example resource route (maps HTTP verbs to controller actions automatically):
    #   resources :products

    # Example resource route with options:
    #   resources :products do
    #     member do
    #       get 'short'
    #       post 'toggle'
    #     end
    #
    #     collection do
    #       get 'sold'
    #     end
    #   end

    # Example resource route with sub-resources:
    #   resources :products do
    #     resources :comments, :sales
    #     resource :seller
    #   end

    # Example resource route with more complex sub-resources:
    #   resources :products do
    #     resources :comments
    #     resources :sales do
    #       get 'recent', on: :collection
    #     end
    #   end

    # Example resource route with concerns:
    #   concern :toggleable do
    #     post 'toggle'
    #   end
    #   resources :posts, concerns: :toggleable
    #   resources :photos, concerns: :toggleable

    # Example resource route within a namespace:
    #   namespace :admin do
    #     # Directs /admin/products/* to Admin::ProductsController
    #     # (app/controllers/admin/products_controller.rb)
    #     resources :products
    #   end
  end
end
