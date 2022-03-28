class OrdersController < ApplicationController
  before_action :authenticate_user
 
  def create
    carted_product = current_user.carted_products.where(status: "carted")
    render json: carted_products

    calculated_subtotal = 0
    carted_products.each do |carted_product|
      carted_subtotal += carted_product.quanity * carted_product.product.price
    end
    # product.price * params[:quantity]
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new  
    (user_id: current_user.id, 
      # product_id: params[:product_id], 
      # quantity: params [:quantity], 
      subtotal: calculated_subtotal,
      # product_id: params[:product_id],
      tax: calculated_tax,
      total: calculated_total
      
      
          
    )
    @order.save
    carted_products.update_all(status: "purchased", order_id: @order.id)
    render template: "orders/show"

    # if order.save
    #   render json: order.as_json
    # else
    # render json: {errors: order.errors.full_messages}, status: 422
    # end
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

