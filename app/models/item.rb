class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image   

  with_options presence: true do
    
    validates :name    , length:{maximum: 40}
    validates :explain , length:{maximum: 1000}
    validates :price   , numericality:{only_integer: true , greater_than_or_equal_to: 300, less_than_or_equal_to:9999999}
    validates :user           
    validates :image          

    with_options numericality:{other_than: 0 , message: "can't be blank"} do
      validates :category_id    
      validates :status_id      
      validates :send_cost_id   
      validates :prefecture_id  
      validates :send_limit_id  
    end
  end

  belongs_to :user
  belongs_to :category 
  belongs_to :status 
  belongs_to :send_cost
  belongs_to :prefecture
  belongs_to :send_limit 

end
