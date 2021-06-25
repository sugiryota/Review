require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end
    context '投稿ができる時' do
      it '全ての条件が存在すれば投稿できること' do
        expect(@message).to be_valid
      end
      it 'audiocommentが存在すれば投稿できること' do
        @message.comment = ' '
        expect(@message).to be_valid
      end
      it 'commentが存在すれば投稿できること' do
        @message.audiocomment = ' '
        expect(@message).to be_valid
      end
    end
    context '投稿ができない時' do
      it 'どちらもなければ投稿できないこと' do
        @message.audiocomment = ' '
        @message.comment = ' '
        expect(@message.errors.full_messages).to include
      end
    end
  end
end
