require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品ができるとき' do
      it 'image,name,explain,category_id,status_id,send_cost_id,prefecture_id,send_limit_id,price,userが全てあり、
      nameが40文字以内,explainが1000文字以内,category_id,status_id,send_cost_id,prefecture_id,send_limit_idが全て0以外のとき' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it 'nameが空のとき' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'nameが40文字より長いとき' do
        name = ''
        41.times do
          name << 'a'
        end
        @item.name = name
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end

      it 'explainが空のとき' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end

      it 'explainが1000文字より長いとき' do
        explain = ''
        1001.times do
          explain << 'a'
        end
        @item.explain = explain
        @item.valid?
        expect(@item.errors.full_messages).to include('Explain is too long (maximum is 1000 characters)')
      end

      it 'category_idが空のとき' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'category_idが0のとき' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'status_idが空のとき' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'status_idが0のとき' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'send_cost_idが空のとき' do
        @item.send_cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Send cost can't be blank")
      end

      it 'send_cost_idが0のとき' do
        @item.send_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Send cost can't be blank")
      end

      it 'prefecture_idが空のとき' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが0のとき' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'send_limit_idが空のとき' do
        @item.send_limit_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Send limit can't be blank")
      end

      it 'send_limit_idが0のとき' do
        @item.send_limit_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Send limit can't be blank")
      end

      it 'priceが空のとき' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300未満のとき' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが9999999より大きいとき' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'priceが小数点以下を含むとき' do
        @item.price = 500.3
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end

      it 'priceが半角数字以外を含むとき' do
        @item.price = 'yaju810８１０'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが半角英字を含むとき' do
        @item.price = 'yaju810'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが全角文字を含むとき' do
        @item.price = 'ｙａｊｕ８１０yaju810'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'userが空のとき' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
