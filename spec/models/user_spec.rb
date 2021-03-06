require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー新規登録ができるとき' do
      it "nickname,first_name,last_name,first_name_reading,last_name_reading,birthday,password,emailが全て揃っており,
      重複するemailがなく,苗字,名前が全角カタカナ,ひらがな,漢字のみで記載されているとき" do
        expect(@user).to be_valid
      end

      it 'passwordが半角英数字混同であるとき' do
        @user.password = 'yaju810'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録ができないとき' do
      it 'nicknameが空のとき' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'first_nameが空のとき' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameがひらがな、カタカナ、漢字以外のときに登録できないこと' do
        @user.first_name = 'yaju'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_nameがひらがな、カタカナ、漢字以外のときに登録できないこと' do
        @user.last_name = 'senpai'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'last_nameが空のとき' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_name_readingが空のとき' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end

      it 'first_name_readingが全角カタカナではないとき' do
        @user.first_name_reading = 'やじゅう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading is invalid')
      end

      it 'last_name_readingが空のとき' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end

      it 'last_name_readingが全角カタカナではないとき' do
        @user.last_name_reading = 'せんぱい'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name reading is invalid')
      end

      it 'birthdayが空のとき' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'emailが空のとき' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@が含まれないとき' do
        @user.email = 'yajugmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複するemailが既に保存されているとき' do
        @other_user = FactoryBot.create(:user)
        @user.email = @other_user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空のとき' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが英字のみのとき' do
        @user.password = 'yajusenpai'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordに全角のものが含まれているとき' do
        @user.password = 'ｙaｊu8１0'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが全て全角のとき' do
        @user.password = 'ｙａｊｕ８１０'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが数字のみのとき' do
        @user.password = '1145141919810'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが６文字未満のとき' do
        @user.password = 'yaju8'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが一致しないとき' do
        @user.password_confirmation = 'tadokorokouzi'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
