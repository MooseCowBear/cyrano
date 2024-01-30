Capybara.server = :puma
Capybara.default_max_wait_time = 10
Capybara.disable_animation = true

Capybara.javascript_driver = :cuprite
Capybara.register_driver(:cuprite) do |app|
  Capybara::Cuprite::Driver.new(app, inspector: ENV["INSPECTOR"])
end

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by(:cuprite, screen_size: [1440, 810], options: {
      js_errors: true,
      headless: %w[0 false].exclude?(ENV["HEADLESS"]),
      slowmo: ENV["SLOWMO"]&.to_f,
      process_timeout: 15,
      timeout: 20
    })
  end

  config.filter_gems_from_backtrace("capybara", "cuprite", "ferrum")
end
