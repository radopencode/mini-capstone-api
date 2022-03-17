class Product < ApplicationRecord
  # validates :name,  presence: true
  # validates :price, presence: true
  # validates :description, presence: true
  # validates :name, presence: true

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def is_discouted
    return price < 10
  end

  def tax
    return [price * 0.09]
  end

  def total
    return tax + price
  end
end
