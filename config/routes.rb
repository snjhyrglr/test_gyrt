Rails.application.routes.draw do
  resources :urd_requirements
  resources :claim_requirements
  devise_for :agents, path: 'agents'
  resources :agents
  devise_for :employees, path: 'employees'
  resources :employees

  get 'download', to: "pages#download"
  get 'preview', to: "pages#preview"
  
  resources :proposal_remarks
  get 'search', to: "search#index"
  
  resources :batch_items do
    get :approve_all, on: :collection
    get :deny_all, on: :collection
    get :approve_item, on: :member
    get :deny_item, on: :member
  end
  resources :batches
  resources :gyrt_rate_multipliers
  resources :gyrt_loadings
  resources :gyrt_coverages
  resources :gyrt_batches
  resources :members do 
    get :batch_form, on: :collection
    post :batch_import, on: :collection
  end
  resources :matrices do 
    get :update_status
  end
  resources :gyrt_proposal_benefits
  
  resources :gyrt_agreements do
    get :to_pdf, on: :member
    get :update_vp, on: :member
    get :update_und, on: :member
    get :update_claims, on: :member
    get :update_agent_coop, on: :member
    get :moa_attachments, on: :member
    patch :upload_coop_logo, on: :member
    patch :upload_ids, on: :member
    patch :upload_signed_moa, on: :member
    get :notarized_moa, on: :member
    patch :upload_notarized_moa, on: :member
  end
  
  resources :proposal_requirements do
    get :remove, on: :member
    get :add, on: :member
  end

  get 'gyrt_proposals/pdf/:id', to: 'gyrt_proposals#pdf', as: 'proposal_pdf'
  resources :gyrt_proposals do
    post :compute_age, on: :collection
    get :update_actuarial_status, on: :member
    get :update_underwriting_status, on: :member
    get :update_claims_status, on: :member
    get :update_agent_coop_status, on: :member
    get :to_pdf, on: :member
  end
  resources :cooperatives
  resources :coop_types
  resources :coop_categories
  resources :geo_barangays
  resources :geo_municipalities do 
    get :selected, on: :member
  end
  resources :geo_provinces do 
    get :selected, on: :member
  end
  resources :geo_regions do 
    get :selected, on: :member
  end
  resources :gyrt_rates
  resources :benefits
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "pages#home"
  root 'gyrt_proposals#index'
end
