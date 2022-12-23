# Generated by Selenium IDE
require 'selenium-webdriver'
require 'json'
# Тест проверяет правильное открытие и закрытие лота
describe 'Opencloserecord' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'opencloserecord' do
    # Пользователь заходит на сайт
    @driver.get('http://localhost:3000/en')
    @driver.find_element(:css, '.btn-outline-light').click
    # Авторизуется как админ
    @driver.find_element(:id, 'email').click
    @driver.find_element(:id, 'email').send_keys('admin@admin.admin')
    @driver.find_element(:id, 'password').click
    @driver.find_element(:id, 'password').send_keys('123123')
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:link_text, 'Home').click
    @driver.find_element(:link_text, 'More').click
    @driver.find_element(:css, '.btn-warning').click
    # Изменяет статус на "Закрыт"
    @driver.find_element(:id, 'record_status').click
    dropdown = @driver.find_element(:id, 'record_status')
    dropdown.find_element(:xpath, "//option[. = 'Аукцион закрыт']").click
    @driver.find_element(:css, 'option:nth-child(2)').click
    @driver.find_element(:name, 'commit').click
    # Проверяет действительно ли закрыт
    expect(@driver.find_element(:css, 'p:nth-child(4)').text).to eq('Аукцион закрыт')
    @driver.find_element(:css, '.btn-warning').click
    # Изменяет статус на "Открыт"
    @driver.find_element(:id, 'record_status').click
    dropdown = @driver.find_element(:id, 'record_status')
    dropdown.find_element(:xpath, "//option[. = 'Аукцион объявлен']").click
    @driver.find_element(:css, 'option:nth-child(1)').click
    @driver.find_element(:name, 'commit').click
    # Проверяет действительно ли открыт
    expect(@driver.find_element(:css, 'p:nth-child(4)').text).to eq('Аукцион объявлен')
  end
end