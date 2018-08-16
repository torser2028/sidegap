Rails.application.routes.draw do
  resources :mail_logs

  ActiveAdmin.routes(self)
  scope '(:locale)', locale: /es|en/ do
    # You can have the root of your site routed with "root"
    authenticated :user do |variable|
        root 'welcome#index', as: :authenticated_root
    end
    root to: redirect('/users/sign_in')

    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }

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
        get :period_stakeholders
        get 'stakeholder/:id', action: :stakeholder, as: :stakeholder
        get :report
        get :legislative
        get :manual_weekly_report
        get :legislatives_by_stakeholder
      end
    end
    resources :institutions, only: [:show]

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
  end
end
