class ProductsController < ApplicationController
  def shop
    better_than_amazon = Product.all
    render json: better_than_amazon.as_json
  end
end
