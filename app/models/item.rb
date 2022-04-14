class Item < ApplicationRecord

  belongs_to :User

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :region_delivery
  belongs_to :days_to_deliver
  has_one_attached :image

  
  with_options presence: true do

    validates :name, length: {maximum: 40}
    validates :explanation, length: {maximum: 1000}
    validates :image

    with_options numericality: { other_than: 1 , message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :region_delivery_id
      validates :days_to_deliver_id
    end

    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
  end

end
