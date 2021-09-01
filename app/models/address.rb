class Address < ApplicationRecord
  attr_accessor :token
  with_options presence: true do
    validates :token
    validates :post_number , format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id , numericality: {only_integer: true , greater_than: 0 , message: "can't be blank"}
    validates :city
    validates :building_number
    validates :phone_number ,length: {maximum: 11 , minimum: 10}  , format: {with: /\A[0-9]+\z/}
    validates :history 
  end
  belongs_to :history
end
