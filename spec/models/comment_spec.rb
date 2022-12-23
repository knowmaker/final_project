# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'test comment' do
    let(:record) do
      file = Rails.root.join('spec', 'support', 'assets', '1660890536_1-sportishka-com-p-samaya-rzhavaya-mashina-v-mire-krasivo-fot-1.jpg')
      record = Record.new(title: 'Машина', photo: nil, description: 'Текст', status: 'Аукцион объявлен')
      record.photo.attach(io: File.open(file), filename: '1660890536_1-sportishka-com-p-samaya-rzhavaya-mashina-v-mire-krasivo-fot-1.jpg')
      record.save
      record
    end

    context 'when valid data' do
      it 'returns success' do
        Comment.new(record_id: record[:id], username: 'mail@mail.ru', cost: 300)
        expect(record.save).to eq true
      end
    end

    context 'when invalid data' do
      it 'returns error message with null' do
        expect { Comment.create! }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'returns error message, null cost' do
        com = Comment.new(record_id: record[:id], username: 'mail@mail.ru', cost: nil)
        com.save

        expect(com.errors.full_messages[0]).to eq 'Bet can\'t be blank'
      end

      it 'returns error message, negative cost' do
        com = Comment.new(record_id: record[:id], username: 'mail@mail.ru', cost: -100)
        com.save

        expect(com.errors.full_messages[0]).to eq 'Bet must be greater than 0'
      end

      it 'returns error message, record_id is null' do
        com = Comment.new(username: 'mail@mail.ru', cost: -100)
        com.save

        expect(com.errors.full_messages[0]).to eq 'Record must exist'
      end
    end
  end
end
