RSpec.configure do |config|
    config.before(:each, type: :system) do
      driven_by :remote_chrome
      Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
      Capybara.server_port = 3000
      Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
    #   driven_by :rack_test
    end
  
    config.before(:each, type: :system, js: true) do
      driven_by :remote_chrome
      Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
      Capybara.server_port = 3000
      Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
      # Capybara.app_host = 'http://app.localhost' # hostname with ‘app’ sub domain that resolves to interface the AUT is being run on
      # Capybara.always_include_port = true
    end
  end
  
  # Chrome
  Capybara.register_driver :remote_chrome do |app|
    url = 'http://chrome:4444/wd/hub'
    caps = ::Selenium::WebDriver::Remote::Capabilities.chrome(
      'goog:chromeOptions' => {
        'args' => [
          'no-sandbox',
          'headless',
          'disable-gpu',
          'window-size=1680,1050'
        #   'window-size=300,200'
        ]
      }
    )
    Capybara::Selenium::Driver.new(app, browser: :remote, url: url, desired_capabilities: caps)
  end

  