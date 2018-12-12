require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

    module InventoryApp
    class Application < Rails::Application
     config.active_record.observers = :stock_observer, :order_observer , :transfer_observer
    # Application configuration should go into files in config/initializersss
    # -- all .rb files in that directory are automatically loaded.
    # /config/environments/development.rb

	# Gmail configuration 
      ActionMailer::Base.smtp_settings = {

     :address              => 'smtp.gmail.com',
     :domail               => 'mail.google.com',
     :port                 =>  587,
     :user_name            => 'rajankshl@gmail.com',
     :password             => 'Loveyou2205', 
     :authentication       => 'login',
     :enable_starttls_auto => true
      }

    end   
end
