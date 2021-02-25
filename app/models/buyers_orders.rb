class DonationAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :address
    validates :city
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Post_code Input correctly"}
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "Phone_number Input only number"}
    validates :token
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code,  prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end