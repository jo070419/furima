class ItemForm
  include ActiveModel::Model
  attr_accessor(
    :name, :description, :category_id, :condition_id, :shipping_fee_id, :shipping_from_id, :shipping_day_id, :price, :user_id, :images,
    :id, :created_at, :datetime, :updated_at, :datetime,
    :tag_name
  )

  validates :name,              presence:     true
  validates :description,       presence:     true
  validates :category_id,       numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_fee_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_from_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :price,             numericality: { only_integer: true }
  validates :user_id,           presence: true
  validates :images,            length:       { minimum: 1, maximum: 5 }

  def save
    item = Item.create(user_id: user_id, name: name, description: description, category_id: category_id, condition_id: condition_id, shipping_fee_id: shipping_fee_id, shipping_from_id: shipping_from_id, shipping_day_id: shipping_day_id, price: price, images: images)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

  def update(params, item)
    # 一度タグの紐付けを消す
    item.item_tag_relations.destroy_all

    #paramsの中のタグの情報を削除。同時に、返り値としてタグの情報を変数に代入
    tag_name = params.delete(:tag_name)

    #もしタグの情報が既に保存されていればインスタンスを取得、なければインスタンスを新規作成
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?

    #タグを保存
    tag.save if tag_name.present?
    item.update(params)
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id) if tag_name.present?
  end
end