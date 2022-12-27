# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'test user' do
    let(:second_user) do
      second_user = User.new(name: 'alex2', email: 'mymail2@mail.ru', password: 'Qw1234',
                             password_confirmation: 'Qw1234')
      second_user.save!
    end

    context 'when valid data' do
      it 'returns success' do
        user = User.new(name: 'alexander', email: 'mylovemail@yandex.ru', password: 'As4567',
                        password_confirmation: 'As4567')

        expect(user.save).to eq true
      end
    end

    context 'when invalid data' do
      it 'returns error message with null' do
        expect { User.create! }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'returns error message, null name' do
        user = User.new(name: nil, email: 'mail.mail@mail.ru', password: '123tyu', password_confirmation: '123tyu')
        user.save

        expect(user.errors.full_messages[0]).to eq 'Username can\'t be blank'
      end

      it 'returns error message, invalid name' do
        user = User.new(name: ('a' * 75).to_s, email: 'mail.mail@mail.ru', password: '123tyu',
                        password_confirmation: '123tyu')
        user.save

        expect(user.errors.full_messages[0]).to eq 'Username is too long (maximum is 50 characters)'
      end

      it 'returns error message, null email' do
        user = User.new(name: 'alexander', email: nil, password: 'Aa123!', password_confirmation: 'Aa123!')
        user.save

        expect(user.errors.full_messages[0]).to eq 'Mail can\'t be blank'
      end

      it 'returns error message, invalid email' do
        user = User.new(name: 'alexander', email: 'qwerty@mail.5t', password: 'Aa123!', password_confirmation: 'Aa123!')
        user.save

        expect(user.errors.full_messages[0]).to eq 'Mail is invalid'
      end

      it 'returns error message, invalid password' do
        user = User.new(name: 'sasha', email: 'hismail@my.com', password: 'Aa', password_confirmation: 'Aa')
        user.save

        expect(user.errors.full_messages[0]).to eq 'Password is too short (minimum is 6 characters)'
      end

      it 'returns error message, password_confirmation != password' do
        user = User.new(name: 'sasha', email: 'hismail@my.com', password: 'Aa123!', password_confirmation: '12314789')
        user.save

        expect(user.errors.full_messages[0]).to eq 'Password confirmation doesn\'t match Password'
      end

      it 'returns error message, exist email' do
        second_user

        user = User.new(name: 'alex', email: 'mymail2@mail.ru', password: 'Qw9874', password_confirmation: 'Qw9874')
        user.save

        expect(user.errors.full_messages[0]).to eq 'Mail has already been taken'
      end
    end
  end
end
