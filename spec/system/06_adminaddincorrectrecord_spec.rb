# Generated by Selenium IDE
require 'selenium-webdriver'
require 'json'
describe 'adminaddnewrecord' do
  before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'incorrect_adminaddnewrecord' do
    @driver.get('http://localhost:3000/en')
    @driver.manage.window.resize_to(1920, 1080)
    @driver.find_element(:css, '.btn-outline-light').click
    @driver.find_element(:id, 'email').click
    @driver.find_element(:id, 'email').send_keys('admin@admin.admin')
    @driver.find_element(:id, 'password').click
    @driver.find_element(:id, 'password').send_keys('123123')
    @driver.find_element(:name, 'commit').click
    @driver.find_element(:link_text, 'Home').click
    @driver.find_element(:css, '.btn-success').click
    @driver.find_element(:id, 'record_title').click
    @driver.find_element(:id, 'record_title').send_keys('Машина для аукциона')
    @driver.find_element(:id, 'record_photo').send_keys('/home/alexander/Рабочий стол/final_project/spec/support/assets/1660890536_1-sportishka-com-p-samaya-rzhavaya-mashina-v-mire-krasivo-fot-1.jpg')
    @driver.find_element(:id, 'record_description').click
    @driver.find_element(:id, 'record_description').send_keys('просто машина')
    @driver.find_element(:name, 'commit').click
    expect(@driver.find_element(:css, '.alert').text).to eq('Description is too short (minimum is 100 characters)')
  end
end