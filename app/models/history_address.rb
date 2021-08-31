class HistoryAddress
  include ActiveModel::Model
  attr_accessor :post_number , :prefecture_id , :city ,:building_number , :building_name ,:phone_number ,  :user_id , :item_id , :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_number , format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id , numericality: {only_integer: true , greater_than: 0 , message: "can't be blank"}
    validates :city
    validates :building_number
    validates :phone_number ,length: {maximum: 11 , minimum: 10}  , format: {with: /\A[0-9]+\z/}
  end

  def save
    @history = History.create(user_id: user_id , item_id: item_id)
    @address =  Address.create(post_number: post_number , prefecture_id: prefecture_id , city: city , building_number: building_number , phone_number: phone_number , building_name: building_name , history_id: @history.id) 
    binding.pry
    
  end
end