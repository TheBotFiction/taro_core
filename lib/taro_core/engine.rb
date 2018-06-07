module TaroCore
  class Engine < ::Rails::Engine
    # :nocov:
    initializer :append_migrations do |app|
      # This prevents migrations from being loaded twice from the inside of the
      # gem itself (dummy test app)
      if app.root.to_s !~ /#{root}/
        config.paths["db/migrate"].expanded.each do |migration_path|
          app.config.paths["db/migrate"] << migration_path
        end
      end
    end
    # :nocov:

    config.generators do |g|
      g.test_framework :rspec
      g.template_engine :haml
      g.assets false
      g.helper false
      g.javascripts false
      g.stylesheets false
      g.views false
      g.resource_route false
      g.scaffold_stylesheet false
      g.fixture_replacement :factory_bot
      g.factory_bot dir: "spec/factories"
    end
  end
end
