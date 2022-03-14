Rails.application.routes.draw do
  get "/better_than_amazon", controller: "products", action: "shop"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/products" => "products#one_product"

  get "/products/:id" => "one_product#show"
  get "/products/:id" => "one_product#index"
end
