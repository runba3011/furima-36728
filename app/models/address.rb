class Address < ApplicationRecord
  with_options presence: true do
    validates :post_number
    validates :prefecture_id
    validates :city
    validates :building_number
    validates :phone_number
    validates :history 
  end
  belongs_to :history
end
