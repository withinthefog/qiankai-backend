require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de


    #添加如下几行代码
    config.action_mailer.default_url_options = { :host => "localhost:3000" } 
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
    :address => "smtp.qq.com",  #smtp.qq.com
    :port => 25,
    :domain => "qq.com",   #qq.com
    :authentication => :login,
    :user_name => "624459434@qq.com", #修改邮箱
    :password => "zhoulin000~" #修改正确的密码
  }
  end
end
