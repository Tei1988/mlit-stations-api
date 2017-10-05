# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api, module: :api do
    resources :stations
  end
end
