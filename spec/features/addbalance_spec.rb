# Generated by Selenium IDE
require 'selenium-webdriver'
require 'json'
# Тест проверяет пополнение баланса пользователем
describe 'Addbalance' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'addbalance' do
    # Пользователь заходит на сайт
    @driver.get('http://localhost:3000/en')
    @driver.find_element(:css, '.btn-outline-light').click
    # Входит со своими данными
    @driver.find_element(:id, 'email').click
    @driver.find_element(:id, 'email').send_keys('cup@gmail.ru')
    @driver.find_element(:id, 'password').click
    @driver.find_element(:id, 'password').send_keys('OMG289')
    @driver.find_element(:name, 'commit').click
    # Идет в личный кабинет для пополнения баланса
    @driver.find_element(:css, '.btn-outline-light:nth-child(1)').click
    @driver.find_element(:css, 'td:nth-child(2)').click
    bal=@driver.find_element(:css, 'td:nth-child(2)').text.sub('Balance: ', '').to_i
    # Вводит сумму для пополнения
    @driver.find_element(:id, 'user_balance').click
    @driver.find_element(:id, 'user_balance').send_keys('900')
    @driver.find_element(:name, 'commit').click
    # Проверяем, что действительно пополнилось
    expect(@driver.find_element(:css, 'td:nth-child(2)').text).to eq("Balance: #{bal+900}")
  end
end