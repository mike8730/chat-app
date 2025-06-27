require 'selenium/webdriver'

Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  # ヘッドレスモード（必要なら）
  # options.add_argument('--headless=new')

  # 競合回避のためユニークなuser-data-dirを指定
  user_data_dir = Dir.mktmpdir("chrome-user-data")
  options.add_argument("--user-data-dir=#{user_data_dir}")

  # 他の必要なオプション
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-gpu')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.javascript_driver = :chrome