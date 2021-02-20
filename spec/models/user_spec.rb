require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
      it 'nicknameとemailとfamily_nameとfirst_nameとfamily_name_kanaとfirst_name_kanaとbirthday、passwordとpassword_confirmationが正しれば登録できる' do
      expect(@user).to be_valid
      end
    end
      context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name Full-width characters")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana kana Full-width katakana characters")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana kana Full-width katakana characters")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      it "emailに@がないと登録できない" do
        @user.email = "kil.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
        end
      it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.first_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
        end
      it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.family_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name Full-width characters")
        end
      it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
        @user.first_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana kana Full-width katakana characters")
        end
      it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
        @user.family_name_kana = "かな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana kana Full-width katakana characters")
        end
      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end
      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end
      it 'passwordが全角の場合は登録できない' do
        @user.password = "AAAAAA"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
        end
    end
  end
end