class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :destroy, :purchase, :update]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item_form = ItemForm.new
  end

  def create
    @item_form = ItemForm.new(item_params)
    if @item_form.valid?
      @item_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    item_attributes = @item.attributes
    @item_form = ItemForm.new(item_attributes)
    @item_form.tag_name = @item.tags&.first&.tag_name
    if @item.purchase_log.present?
      redirect_to root_path
    end
  end

  def update
    @item_form = ItemForm.new(item_params)

    # 画像を選択し直していない場合は、既存の画像をセットする
    @item_form.images ||= @item.images.blobs

    if @item_form.valid?
      @item_form.update(item_params, @item)
      redirect_to action: :show
    else
      render :edit
    end
  end
  
  def destroy
    @item.destroy
    redirect_to root_path
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:keyword]}%"])
    render json:{ keyword: tag }
  end

  private

  def item_params
    params.require(:item_form).permit(:name, :description, :category_id, :condition_id, :shipping_fee_id, :shipping_from_id, :shipping_day_id, :price, :tag_name, {images: []}).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
