class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products
end

def update_totals
  calculated_subtotal = 0
  carted_products.each do |carted_product|
    carted_subtotal += carted_product.quanity * carted_product.product.price
    end
    # product.price * params[:quantity]
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_subtotal + calculated_tax
    
    self.subtotal = calculated_subtotal,
    self.tax = calculated_tax,
    self.total = calculated_total
    self.save