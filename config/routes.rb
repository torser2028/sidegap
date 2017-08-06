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
    get 'login' => 'welcome#login', as: :login

    concern :followable do
        member do
            get :follow
            get :unfollow
        end
        collection do
            get :favorites
        end
    end

    concern :trashable do
        member do
            get :like
            get :dislike
        end
        collection do
            get :trash
        end
    end

    resources :legislatives, only: [:index, :show] do
        concerns [:followable, :trashable]
        collection do
            get :projects_law
            get :projects_old
            get :events
            get :events_commission
            get :stakeholders
            get 'stakeholder/:id', action: :stakeholder, as: :stakeholder
            get :report
            get :legislative
            get :manual_weekly_report
        end
    end

    resources :comments, only: [:create, :update]
    resources :user_notifications, only: [:create]

    resources :rules, only: [:index, :show] do
        concerns :followable
        collection do
          get :notifications
          get :inactive
          get :export_xls
        end
    end

    resources :councils, only: [:index, :show] do
        concerns [:followable, :trashable]
        concerns [:followable, :trashable]
        collection do
          get :projects_approved
          get :projects_old
          get :councillors
          get 'councillor/:id', action: :councillor, as: :councillor
          get :report
          post :report
          get :observation
          post :observation
          get :council
        end
    end

    resources :events, only: [:index, :show] do
        concerns [:followable, :trashable]
    end

    # resources :executives, only: [:index, :show] do
    #     concerns :followable
    #     collection do
    #         get :favorites
    #         get :officials
    #         get 'official/:id', action: :official, as: :official
    #     end
    # end

    # resources :judicials, only: [:show] do
    #     concerns :followable
    #     collection do
    #         get :preview
    #         get :favorites
    #         get :magistrates
    #         get 'magistrate/:id', action: :magistrate, as: :magistrate

    #         resources :supreme_courts, controller: :judicials, type: 'SupremeCourt', only: [:index]
    #         resources :council_states, controller: :judicials, type: 'CouncilState', only: [:index]
    #         resources :superior_councils, controller: :judicials, type: 'SuperiorCouncil', only: [:index]
    #         resources :constitutional_courts, controller: :judicials, type: 'ConstitutionalCourt', only: [:index]
    #     end
    # end

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
