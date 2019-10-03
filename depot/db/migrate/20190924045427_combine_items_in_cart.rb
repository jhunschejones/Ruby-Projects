class CombineItemsInCart < ActiveRecord::Migration[5.1]
  def up
    # replace duplicate items with a single item and appropriate quantity
    Cart.all.each do |cart|
      # count items in cart by product_id
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          # remove duplicate items
          cart.line_items.where(product_id: product_id).delete_all

          # replace with single items
          item = cart.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  # undo the change and split out into duplicate items again!
  def down
    LineItem.where("quantity > 1").each do |line_item|
      line_item.quantity.times do
        LineItem.create(
          cart_id: line_item.cart_id,
          product_id: line_item.product_id,
          quantity: 1
        )
      end
      line_item.destroy # remove origional item
    end
  end

end
