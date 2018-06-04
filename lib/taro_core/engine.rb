module TaroCore
  class Engine < ::Rails::Engine
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
