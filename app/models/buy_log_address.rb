class BuyLogAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :region_delivery_id, :city,
                :street_address, :building_name, :phone_number, :buy_log_id, :token

  # バリデーション
  with_options presence: true do

    validates :user_id
    validates :item_id
    validates :region_delivery_id, numericality: {other_than: 1}
    validates :city
    validates :street_address
    validates :phone_number
    validates :token

  end
  validates :postcode, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number, numericality: {only_integer: true, message: 'is invalid. Input only number'}
  validates :phone_number, length: {minimum: 10, maximum: 11, message: 'is too short'}

  def save
    # 各テーブルにデータを保存する処理を書く
    
    buy_log = BuyLog.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    
    address = Address.create(
      postcode: postcode, region_delivery_id: region_delivery_id, city: city, street_address: street_address,
      building_name: building_name, phone_number: phone_number, buy_log_id: buy_log.id
    )
    
  end
end