class OrdersController < ApplicationController
  def create
    @order = Order.new  (user_id: params["user_id"], product_id: params["product_id"], quantity: params ["quantity"], subtotal: params["subtotal"], tax: params["tax"], total: ["total"])
    render :json order.as_json
  end

  def show
   order = params[:id]
    order = Order.find_by(id: order_id)
    @order = order
   render template: "orders/show"
  end

  def index
    pp 
    @orders = Product.all
    render template: "orders/index"
  end
end

