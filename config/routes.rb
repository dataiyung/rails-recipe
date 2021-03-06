Rails.application.routes.draw do
  get "/faq" => "pages#faq"
  devise_for :users
    resource :user
    resources :events do
      resources :registrations do
        member do
          get "steps/2" => "registrations#step2", :as => :step2
          patch "steps/2/update" => "registrations#step2_update", :as => :update_step2
          get "steps/3" => "registrations#step3", :as => :step3
          patch "steps/3/update" => "registrations#step3_update", :as => :update_step3

        end
      end
    end
    root "events#index"
  namespace :admin do
    root "events#index"
    resources :events do
      resources :tickets, :controller => "event_tickets"

      member do
       post :reorder
    end
           collection do
             post :bulk_update
           end
    end
    resources :users do
      resource :profile, :controller => "user_profiles"
    end

  end


end
