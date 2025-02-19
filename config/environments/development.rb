Rails.application.configure do
  # Paramètres spécifiés ici auront la priorité sur ceux dans config/application.rb.

  # Dans l'environnement de développement, le code de votre application est rechargé à chaque requête.
  # Cela ralentit le temps de réponse mais est parfait pour le développement
  # car vous n'avez pas besoin de redémarrer le serveur web lorsque vous modifiez le code.
  config.cache_classes = false

  # Ne pas charger le code au démarrage.
  config.eager_load = false

  # Afficher les rapports d'erreurs complets.
  config.consider_all_requests_local = true

  # Activer/désactiver la mise en cache. Par défaut, la mise en cache est désactivée.
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

  # Ne pas se soucier si le mailer ne peut pas envoyer.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Configurer l'hôte par défaut pour les URL générées
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  # Imprimer les avis de dépréciation dans le journal Rails.
  config.active_support.deprecation = :log

  # Lever une erreur au chargement de la page s'il y a des migrations en attente.
  config.active_record.migration_error = :page_load

  # Le mode debug désactive la concaténation et le prétraitement des assets.
  # Cette option peut provoquer des délais importants dans le rendu des vues avec un grand
  # nombre d'assets complexes.
  config.assets.debug = true

  # Supprimer la sortie du logger pour les requêtes d'assets.
  config.assets.quiet = true

  # Lever une erreur pour les traductions manquantes.
  # config.action_view.raise_on_missing_translations = true

  # Utiliser un observateur de fichiers événementiel pour détecter de manière asynchrone les changements dans le code source,
  # les routes, les locales, etc. Cette fonctionnalité dépend de la gem listen.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
end
