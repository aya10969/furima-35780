require 'rails_helper'

RSpec.describe User, type: :model do
  before do
      @user = FactoryBot.build(:user)
   end

    describe '新規登録/ユーザー情報' do
      context '新規登録がうまくいくとき' do
        it '全て正常' do
          expect(@user).to be_valid
        end
      end
      
      context '新規登録がうまくいかない時' do
        it 'メールアドレスが一意性でないと登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it 'メールアドレスは、@を含まないと登録できない' do
          @user.email = 'test.co.jp'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'パスワードが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'パスワードは、５文字以下では登録できない' do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it 'パスワードとパスワード（確認）が不一致では登録できない' do
          @user.password = '000000'
          @user.password_confirmation = '111111'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end


        it 'お名前(全角)は、名字と名前がそれぞれ空では登録できない' do
          @user.last_name = ''
          @user.name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include
          ("Name can't be blank"
            "Name 全角文字を使用してください"
            "Last name can't be blank"
            "Last name 全角文字を使用してください")
        end
        it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）でしか登録できない' do
          @user.last_name = 'yamada'
          @user.name = 'tarou'
          @user.valid?
          expect(@user.errors.full_messages).to include("Name 全角文字を使用してください","Last name 全角文字を使用してください")
        end
          
        it 'お名前カナ(全角)は、全角（カタカナ）でしか登録できない' do
          @user.last_name_furigana = 'yamada'
          @user.name_furigana = 'tarou'
          @user.valid?
          expect(@user.errors.full_messages).to include("Name furigana 全角（カタカナ）を使用してください", "Last name furigana 全角（カタカナ）を使用してください")
        end
        it '生年月日が空白では登録できない' do
          @user.birthday  = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
end


