Rails.application.routes.draw do
  devise_for :patients
  devise_for :doctors
  

  root to: "homes#index"

  authenticated :patient do
  	scope '/patient' do 
  		get '/blood_glucose_level', :to => "patient/blood_glucose_level#index"
  	end
    namespace :patient do
      resources :blood_glucose_level, except: [:index]
    end
  end

  authenticated :doctor do
  	get '/Patients', :to => "doctors#patients_list"
  	scope '/patient' do 
  		get '/blood_glucose_level', :to => "patient/blood_glucose_level#index"
  	end
  end

end
