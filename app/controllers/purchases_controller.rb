class PurchasesController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @purchase_log_delivery_address = PurchaseLogDeliveryAddress.new
  end

  def create
    binding.pry
    @purchase_log_delivery_address = PurchaseLogDeliveryAddress.new(purchase_params)
    if @purchase_log_delivery_address.valid?
      @purchase_log_delivery_address.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'new'
    end
  end

  private

  def purchase_params
    params.require(:purchase_log_delivery_address).permit(:post_code, :prefecture, :municipality, :house_number, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_9ac572f851362d20f9afd61a"
    Payjp::Charge.create(
      amount: item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end