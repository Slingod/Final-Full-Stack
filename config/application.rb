require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EventbriteApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Configuration for the application, engines, and railties goes ici.
    # Ces paramètres peuvent être remplacés dans les fichiers d'environnements spécifiques.
    
    # Définir le fuseau horaire par défaut
    config.time_zone = "Paris"

    # Définir la langue par défaut
    config.i18n.default_locale = :en

    # Ajouter le dossier lib/ aux chemins de chargement automatique
    config.autoload_paths += %W(#{config.root}/lib)

    # Precompile additional assets (JPG, PNG, JPEG, GIF)
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end
