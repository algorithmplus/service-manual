# rubocop:disable Metrics/BlockLength
Rails.application.routes.draw do
  mount Flipflop::Engine => '/features' if Rails.env.development?

  constraints(UserConstraint.new) do
    get '/pages/:page', to: 'pages#show'

    get '/manual/:uri', to: 'manual#area'

    get '/status', to: 'status#index'

    get '/404', to: 'errors#not_found', via: :all
    get '/422', to: 'errors#unprocessable_entity', via: :all
    get '/500', to: 'errors#internal_server_error', via: :all

    get 'cookies-policy', to: 'pages#cookies_policy'
    get 'privacy-policy', to: 'pages#privacy_policy'
    get 'information-sources', to: 'pages#information_sources'
    get 'accessibility-statement', to: 'pages#accessibility_statement'
    get 'terms-and-conditions', to: 'pages#terms_and_conditions'

    resources :feedback_surveys, only: %i[create]

    root to: 'home#index'
  end
end
# rubocop:enable Metrics/BlockLength
