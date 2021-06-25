require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '投稿ができる時' do
      it '全ての条件が存在あれば投稿できること' do
        expect(@item).to be_valid
      end
      it '写真がなくても投稿できること' do
        @item.image = nil
        expect(@item).to be_valid
      end
      it 'テキストがなくても投稿できること' do
        @item.text = ' '
        expect(@item).to be_valid
      end
      it 'urlがなくても投稿できること' do
        @item.url = ' '
        expect(@item).to be_valid
      end
      it 'ミニカテゴリーがなくても投稿できること' do
        @item.minicategory = ' '
        expect(@item).to be_valid
      end
    end
    context '投稿ができない時' do
      it '作品名がなくては投稿できないこと' do
        @item.name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'カテゴリーが必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '音声が必須であること' do
        @item.audio = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Audio can't be blank")
      end
    end
  end
end
