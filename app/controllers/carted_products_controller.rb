class CartedProductsController < ApplicationController
  def create
    cartedproduct = CartedProduct.find_by(id: params[product_id])
  end
end
