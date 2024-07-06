Rails.application.routes.draw do
  devise_for :employees
  post "/new_employee", to: "employees#create"
  
  resources :feedbacks
  root "departments#index"
  # POST employees/:employee_id/feedbacks
  resources :employees do
    resources :feedbacks, only: :create
  end
  # POST departments/:department_id/feedbacks
  resources :departments  do
    resources :feedbacks, only: :create
  end
end
