class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy # destroy associated line items if the cart is destroyed
end
