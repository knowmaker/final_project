# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Record, type: :model do
  describe 'test record' do
    context 'when valid data' do
      it 'returns success' do
        file = Rails.root.join('spec', 'support', 'assets', '1660890536_1-sportishka-com-p-samaya-rzhavaya-mashina-v-mire-krasivo-fot-1.jpg')
        record = Record.new(title: 'Машина', photo: nil, description: "#{'текст'*25}", status: 'Аукцион объявлен')
        record.photo.attach(io: File.open(file), filename: '1660890536_1-sportishka-com-p-samaya-rzhavaya-mashina-v-mire-krasivo-fot-1.jpg')
        expect(record.save).to eq true
      end
    end
    context 'when invalid data' do
      it 'returns error message with null' do
        expect { Record.create! }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'returns error message, null title' do
        file = Rails.root.join('spec', 'support', 'assets', '1660890536_1-sportishka-com-p-samaya-rzhavaya-mashina-v-mire-krasivo-fot-1.jpg')
        record = Record.new(title: nil, photo: nil, description: "#{'текст'*25}", status: 'Аукцион объявлен')
        record.photo.attach(io: File.open(file), filename: '1660890536_1-sportishka-com-p-samaya-rzhavaya-mashina-v-mire-krasivo-fot-1.jpg')
        record.save
        expect(record.errors.full_messages[0]).to eq 'Name can\'t be blank'
      end

      it 'returns error message, invalid title' do
        record = Record.new(title: "#{'a'*75}", photo: nil, description: "#{'текст'*25}", status: 'Аукцион объявлен')
        record.save

        expect(record.errors.full_messages[0]).to eq 'Name is too long (maximum is 30 characters)'
      end

      it 'returns error message, invalid photo' do
        record = Record.new(title: 'Машина', photo: nil, description: 'Текст', status: 'Аукцион объявлен')
        record.save

        expect(record.errors.full_messages[0]).to eq 'Photo can\'t be blank'
      end

      it 'returns error message, null description' do
        file = Rails.root.join('spec', 'support', 'assets', '1660890536_1-sportishka-com-p-samaya-rzhavaya-mashina-v-mire-krasivo-fot-1.jpg')
        record = Record.new(title: 'Машина', photo: nil, description: nil, status: 'Аукцион объявлен')
        record.photo.attach(io: File.open(file), filename: '1660890536_1-sportishka-com-p-samaya-rzhavaya-mashina-v-mire-krasivo-fot-1.jpg')
        record.save

        expect(record.errors.full_messages[0]).to eq 'Description can\'t be blank'
      end

      it 'returns error message, invalid short description' do
        file = Rails.root.join('spec', 'support', 'assets', '1660890536_1-sportishka-com-p-samaya-rzhavaya-mashina-v-mire-krasivo-fot-1.jpg')
        record = Record.new(title: 'Машина', photo: nil, description: "#{'текст'*5}", status: 'Аукцион объявлен')
        record.photo.attach(io: File.open(file), filename: '1660890536_1-sportishka-com-p-samaya-rzhavaya-mashina-v-mire-krasivo-fot-1.jpg')
        record.save

        expect(record.errors.full_messages[0]).to eq 'Description is too short (minimum is 100 characters)'
      end

      it 'returns error message, invalid description' do
        file = Rails.root.join('spec', 'support', 'assets', '1660890536_1-sportishka-com-p-samaya-rzhavaya-mashina-v-mire-krasivo-fot-1.jpg')
        record = Record.new(title: 'Машина', photo: nil, description: "#{'текст'*150}", status: 'Аукцион объявлен')
        record.photo.attach(io: File.open(file), filename: '1660890536_1-sportishka-com-p-samaya-rzhavaya-mashina-v-mire-krasivo-fot-1.jpg')
        record.save

        expect(record.errors.full_messages[0]).to eq 'Description is too long (maximum is 555 characters)'
      end
    end
  end
end
