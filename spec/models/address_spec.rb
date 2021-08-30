require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '発送先の情報を登録できるとき' do
    it "post_number,prefecture_id,city,building_number,phone_numberが全てあり、
      historyテーブルと紐づいているとき" do
      @address.valid?
      expect(@address).to be_valid
    end

    it 'building_nameはなくても保存できる' do
      @address.building_name = nil
      expect(@address).to be_valid
    end
  end

  describe '発送先の情報を登録できないとき' do
    it 'post_numberが空のとき' do
      @address.post_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Post number can't be blank")
    end

    it 'post_numberが - を含まないとき' do
      @address.post_number = "444444"
      @address.valid?
      expect(@address.errors.full_messages).to include("Post number is invalid")
    end 

    it 'post_number短すぎるとき' do
      @address.post_number = "4444"
      @address.valid?
      expect(@address.errors.full_messages).to include("Post number is invalid")
    end

    it 'post_numberが長すぎるとき' do 
      @address.post_number = "44444444444444"
      @address.valid?
      expect(@address.errors.full_messages).to include("Post number is invalid")
    end

    it 'post_numberが数字、ハイフン以外を含むとき' do
      @address.post_number = "4aa-8aaa"
      @address.valid?
      expect(@address.errors.full_messages).to include("Post number is invalid")
    end
    
    it 'prefecture_idが空のとき' do
      @address.prefecture_id = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'prefecture_idが０のとき' do
      @address.prefecture_id = 0
      @address.valid?
      expect(@address.errors.full_messages).to include("Prefecture can't be blank")
    end
    
    it 'cityが空のとき' do
      @address.city = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("City can't be blank")
    end
    
    it 'building_numberが空のとき' do
      @address.building_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Building number can't be blank")
    end
    
    it 'phone_numberが空のとき' do
      @address.phone_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが - を含むとき' do
      @address.phone_number = "080-1919-1919"
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberが全角数字を含むとき' do
      @address.phone_number = "０８０１９１９１９１９"
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberが10文字未満のとき' do
      @address.phone_number = "123456789"
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
    end

    it 'phone_numberが12文字以上のとき' do
      @address.phone_number = "123456789012"
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    
    it 'historyが空のとき' do
      @address.history = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("History can't be blank")
    end
  end
end
