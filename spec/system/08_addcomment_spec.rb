# frozen_string_literal: true

# Generated by Selenium IDE
require 'selenium-webdriver'
require 'json'
require 'faker'
# Тест проверяет возможность сделать ставку пользователю
describe 'Addcomment' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @vars = {}
    @email = Faker::Internet.email
  end
  after(:each) do
    @driver.quit
  end
  it 'addcomment' do
    # Пользователь заходит на сайт
    @driver.get('http://localhost:3000/en')
    @driver.manage.window.resize_to(1920, 1080)
    # Нажимает кнопку регистрации
    @driver.find_element(:css, '.btn-warning').click
    # Вводит данные
    @driver.find_element(:id, 'user_name').click
    @driver.find_element(:id, 'user_name').send_keys('alexander')
    @driver.find_element(:id, 'user_email').click
    @driver.find_element(:id, 'user_email').send_keys(@email)
    @driver.find_element(:id, 'user_password').click
    @driver.find_element(:id, 'user_password').send_keys('qwerty')
    @driver.find_element(:id, 'user_password_confirmation').click
    @driver.find_element(:id, 'user_password_confirmation').send_keys('qwerty')
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:link_text, 'Find').click
    @driver.find_element(:link_text, 'More').click
    # Вводит ставку
    @driver.find_element(:id, 'comment_cost').click
    @driver.find_element(:id, 'comment_cost').send_keys('3000')
    @driver.find_element(:name, 'commit').click
    # Проверяем, что ставка сделана и больше поставить уже нельзя
    expect(@driver.find_element(:css, '.alert:nth-child(3) strong').text).to eq(@email)
    sleep 1
    body_text = @driver.find_element(:css, '.container:nth-child(3)').text
    expect(body_text.include?('Bet Completed')).to be true
  end
end
