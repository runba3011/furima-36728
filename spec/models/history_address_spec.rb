require 'rails_helper'

RSpec.describe HistoryAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @history_address = FactoryBot.build(:history_address , item_id: @item.id , user_id: @user.id)
    sleep 0.1
  end

  describe '購入履歴と発送先の両方の保存ができるとき' do
    it 'user,itemに紐づいており、かつaddressテーブルの情報を持っているとき' do
      expect(@history_address).to be_valid
    end

    it "post_number,prefecture_id,city,building_number,phone_numberが全てあり、
      historyテーブルと紐づいているとき" do
      @history_address.valid?
      expect(@history_address).to be_valid
    end

    it 'building_nameはなくても保存できる' do
      @history_address.building_name = nil
      expect(@history_address).to be_valid
    end
  end

  describe '購入履歴が保存ができず、それによって発送先も保存できなくなるとき' do
    it 'Usersテーブルと紐づいていないとき' do
      @history_address.user_id = nil
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("User can't be blank")
    end

    it 'Itemsテーブルと紐づいていないとき' do
      @history_address.item_id = nil
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Item can't be blank")
    end
  end

  describe '発送先の情報を保存できず、それによって購入履歴も保存できないとき' do
    it 'post_numberが空のとき' do
      @history_address.post_number = nil
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Post number can't be blank")
    end

    it 'post_numberが - を含まないとき' do
      @history_address.post_number = "444444"
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Post number is invalid")
    end 

    it 'post_number短すぎるとき' do
      @history_address.post_number = "4444"
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Post number is invalid")
    end

    it 'post_numberが長すぎるとき' do 
      @history_address.post_number = "44444444444444"
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Post number is invalid")
    end

    it 'post_numberが数字、ハイフン以外を含むとき' do
      @history_address.post_number = "4aa-8aaa"
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Post number is invalid")
    end
    
    it 'prefecture_idが空のとき' do
      @history_address.prefecture_id = nil
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefecture_idが０のとき' do
      @history_address.prefecture_id = 0
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    
    it 'cityが空のとき' do
      @history_address.city = nil
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("City can't be blank")
    end
    
    it 'building_numberが空のとき' do
      @history_address.building_number = nil
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Building number can't be blank")
    end
    
    it 'phone_numberが空のとき' do
      @history_address.phone_number = nil
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが - を含むとき' do
      @history_address.phone_number = "080-1919-1919"
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberが全角数字を含むとき' do
      @history_address.phone_number = "０８０１９１９１９１９"
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberが10文字未満のとき' do
      @history_address.phone_number = "123456789"
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
    end

    it 'phone_numberが12文字以上のとき' do
      @history_address.phone_number = "123456789012"
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
  end

  describe 'トークンの情報が含まれておらず、それによって他のものも保存できない時' do
    it 'トークンが空のとき' do
      @history_address.token = nil
      @history_address.valid?
      expect(@history_address.errors.full_messages).to include("Token can't be blank")
    end
  end 
end
