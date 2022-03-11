Rails.application.routes.draw do
  get "/better_than_amazon", controller: "products", action: "shop"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/one_product" => "products#one_product"

  get "/one_product/:id" => "one_product#show"
  get "/one_product/:id" => "one_product#index"
end
