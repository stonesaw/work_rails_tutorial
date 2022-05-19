class CombineItemsInCart < ActiveRecord::Migration[7.0]
  def up
    # カート内に1つの商品に対して複数の品目があった場合は、1つの品目に置き換える
    Cart.all.each do |cart|
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          # 個別の品目を削除する
          cart.line_items.where(product_id: product_id).delete_all

          # 1つ目の品目に置き換える
          cart.line_items.create(product_id: product_id, quantity: quantity)
        end
      end
    end
  end

  def down
    # 数量の品目を複数の品目に分割する
    LineItem.where("quantity>1").each do |line_item|
      line_item.quantity.times do
        LineItem.create cart_id: line_item.cart_id,
                        product_id: line_item.product_id,
                        quantity: 1
      end

      line_item.destroy
    end
  end
end
