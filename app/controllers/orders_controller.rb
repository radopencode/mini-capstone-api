class OrdersController < ApplicationController
  def create
    @order = Order.new  (user_id: params["user_id"], product_id: params["product_id"], quantity: params ["quantity"], subtotal: params["subtotal"], tax: params["tax"], total: ["total"])
    render :json order.as_json

    if order.save
      render json: order.as_json
    else
    render json: {errors: order.errors.full_messages}, status: 422
    end
   end
  end
    
  def show
   order_id = params[:id]
    order = Order.find_by(id: order_id)
    render json: order.as_json
    # @order = orders
  #  render template: "orders/show"
  end

  def index
    pp 
    @orders = Order.all
    render template: "orders/index"
  end
end

