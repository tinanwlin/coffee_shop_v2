class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  before_save :update_total
  
  def calculate_total
    Rails.logger.debug p self.order_items.collect
    self.order_items.collect { |item| item.product.price * item.quantity }.sum
  end

  private

  def update_total
    self.total_price = calculate_total
  end
  
end
