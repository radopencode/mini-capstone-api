class Product < ApplicationRecord
  # validates :name,  presence: true
  # validates :price, presence: true
  # validates :description, presence: true
  # validates :name, presence: true

  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # def images
  #   Image.where(product_id: id)
  # end
 

  belongs_to :supplier

  has_many :images

  has_many :orders

  def is_discouted
    if price <= 10
      return true
    else
      return false
    end
  end

  def tax
    price * 0.09
  end

  def total
    tax + price
  end
end
