# Load the Rails application.
require_relative 'application'

Rails.application.configure do
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "hunschejones.com",
    authentication: "plain",
    user_name: "josh",
    password: "secret",
    enable_starttls_auto: true
  }
end
# Initialize the Rails application.
Rails.application.initialize!
