require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @group = FactoryBot.build(:group)
  end

  describe 'グループ新規作成' do
    context '正常系' do
      it '全ての情報が入力されていれば新規グループ作成ができること' do
        expect(@group).to be_valid
      end
    end

    context '異常系' do
      it 'グループ名がないと登録できないこと' do        
        @group.name = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Name can't be blank")
      end
    end
  
  end
end
