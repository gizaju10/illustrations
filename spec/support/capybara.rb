# Capybara.register_driver :chrome_headless do |app|
#     options = ::Selenium::WebDriver::Chrome::Options.new
  
#     options.add_argument('--headless')
#     options.add_argument('--no-sandbox')
#     options.add_argument('--disable-dev-shm-usage')
#     options.add_argument('--window-size=1400,1400')
  
#     Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
#   end
  
#   Capybara.javascript_driver = :chrome_headless
  
#   RSpec.configure do |config|
#     config.before(:each, type: :system) do
#       driven_by :rack_test
#     end
  
#     config.before(:each, type: :system, js: true) do
#       if ENV["SELENIUM_DRIVER_URL"].present?
#         driven_by :selenium, using: :chrome, options: {
#           browser: :remote,
#           url: ENV.fetch("SELENIUM_DRIVER_URL"),
#           desired_capabilities: :chrome
#         }
#       else
#         driven_by :selenium_chrome_headless
#       end
#     end
#   end

Capybara.register_driver :remote_chrome do |app|
    url = "http://chrome:4444/wd/hub"
    caps = ::Selenium::WebDriver::Remote::Capabilities.chrome(
      "goog:chromeOptions" => {
        "args" => [
          "no-sandbox",
          "headless",
          "disable-gpu",
          "window-size=1680,1050"
        ]
      }
    )
    Capybara::Selenium::Driver.new(app, browser: :remote, url: url, desired_capabilities: caps)
  end
  
  RSpec.configure do |config|
  
    config.before(:each, type: :system) do
      driven_by :rack_test
    end
  
    config.before(:each, type: :system, js: true) do
      driven_by :remote_chrome
    #   driven_by :selenium_chrome_headless
    #   driven_by :selenium_chrome
      Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    #   Capybara.server_port = 4444
      Capybara.server_port = 3000
    #   Capybara.server_port = :puma
    #   Capybara.server_port = :nginx
    #   Capybara.server_port = 1
      Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
    end
  
  end