class ItemController < ApplicationController

  def index
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_fee_id, :shipping_from_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
