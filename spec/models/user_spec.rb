require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録機能' do
    context '正常系' do
      it '全ての情報が入力されていれば新規登録ができること' do
        expect(@user).to be_valid
      end
    end

    context '異常系' do
      it '名前がないと登録できないこと' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'ユーザーIDがないと登録できないこと' do
        @user.user_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("User can't be blank")
      end

      it 'ユーザーIDが重複していると登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.user_id = @user.user_id
        another_user.valid?
        expect(another_user.errors.full_messages).to include("User has already been taken")
      end

      it 'メールアドレスがないと登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '電話番号がないと登録できないこと' do
        @user.phone = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Phone can't be blank")
      end

      it 'パスワードがないと登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが5文字以下だと登録できないこと' do   # パスワードのバリデーションはdevise token authのものを使う
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
    end
  end
end