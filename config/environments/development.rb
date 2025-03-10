Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment, your application's code is reloaded on every request.
  # This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default, caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Set the default host for URL generation
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Set asset host for emails (needed to display images in emails)
  config.action_mailer.asset_host = 'http://localhost:3000'

  # Configure SMTP settings for email sending
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "localhost",
    authentication: "plain",
    enable_starttls_auto: true,
    user_name: ENV["EMAIL_USERNAME"], # Stored in an environment variable
    password: ENV["EMAIL_PASSWORD"]  # Stored in an environment variable
  }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in rendering views with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logging of asset requests.
  config.assets.quiet = true

  # Raise an error on missing translations.
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Active Storage configuration
  config.active_storage.service = :local
end
