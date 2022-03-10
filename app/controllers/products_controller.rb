class ProductsController < ApplicationController
  def shop
    better_than_amazon = Product.all
    render json: better_than_amazon.as_json
  end
end

def product_all
  input_value = params
  render json: 
end
def one_product
  product_id = params["id"]
  product = Product.find_by(id: product_id)
  render json: product.as_json
end