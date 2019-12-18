Spiderdash::Application.routes.draw do
  resources :users do
    member do
      post :game_progress
      post :highscore
      get :sync_game_progress
      post :game_data
      post :feedback
    end
  end
  resources :sessions do
    collection do
      post :delete
    end
  end
  scope "/editor" do
    resources :games do
      member do
        get :duplicate
      end
    end
    resources :worlds do
      member do
        get :duplicate
        get :stats
      end
    end
    resources :bonus do
      member do
        get :duplicate
      end
    end
    resources :sprites do
      member do
        get :duplicate
      end
    end
    resources :levels do
      member do
        get :duplicate
      end
    end
    resources :checkpoints
  end
  get "editor", :to => "games#index"
  get "home/index"
  get "stats/index"
  get "users/:user_id/worlds/:id/stats", :to => "users#world_stats", :as => "stats_world_user"
  get "tests", :to => "home#tests", :as => "tests"
  root :to => 'home#index'
  get "/:slug" => "home#index"
end
