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

# def show
#  product_id = params[:id]
#  product = Product.find_by(id: product_id)
#   render json: one_product.as_json(methods:[:is_discouted?, :tax, :total])
  
# end

def show
 product = params[:id]
 product = Product.find_by(id: product_id)
 @product = product
render template: "products/show"
  
end


# def index
#   one_product_id = params[:id]
#   one_product = Product.find_by(id:one_product)
#   render json = one_product.as_json
# end

def index
  pp 
  @products = Product.all
  render template: "products/index"
end

def create
  @product = Product.new(name: params ["name"], description = params ["description"], price = params ["price"], image_url = params ["image_url"]

  if@product.save

  render json = one_product.as_json
end

def update
  product_id = params[:id]
  product = Product.find_by(id: product_id)
  product.name = params["name"] || product.name 
  product.description = params["description"] || product.description
  product.price = params["price"] || product.price
  product.image_url = params["image_url"] || product.image_url

 product.save
 render json: product.as_json
 if product.save
  render json: show
  
 else
  render json: {errors: product.errors.full_messages}, status: 422
 end
  
end
end

def destroy

  product_id = params[:id]
  product = Product.find_by(id: product_id)

  product.destroy
  render json: product.as_json
end