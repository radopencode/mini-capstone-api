class OrdersController < ApplicationController
  before_action :authenticate_user
 
  def create
    product = Product.find_by(id: params[product_id])

    calculated_subtotal = product.price * params[:quantity]
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax
    @order = Order.new  
    (user_id: current_user.id, 
      # product_id: params[:product_id], 
      quantity: params [:quantity], 
      subtotal: calculated_subtotal,
      product_id: params[:product_id],
      tax: calculated_tax
      total: calculated_total
      
      
          
    )
    render :json order.as_json

    if order.save
      render json: order.as_json
    else
    render json: {errors: order.errors.full_messages}, status: 422
    end
   end
  end
    
  def show
    @order = current_user.orders.find_by(id: params[:id])
    # render json: order
   
  render template: "orders/show"
  end
end

  def index
    if current_user
      @orders = current_user.orders
      render template: "orders/index"
    else
      render json: [], status: :unauthorized

  end
end

