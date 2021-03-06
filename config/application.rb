require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PowerSystem
  class Application < Rails::Application

    Dir[
      "lib/spread_sheet_parser/task/sheet_728kw.rb",
      "lib/spread_sheet_parser/task/sheet_683_point_2kw.rb",
      "lib/spread_sheet_parser/task/sheet_620_point_6kw.rb",
      "lib/spread_sheet_parser/task/sheet_603_point_2kw.rb",
      "lib/spread_sheet_parser/task/sheet_690_point_3kw.rb",
      "lib/spread_sheet_parser/task/sheet_613_point_6kw.rb",
      "lib/spread_sheet_parser/task/sheet_743_point_4kw.rb",
      "lib/spread_sheet_parser/task/sheet_671kw.rb",
      "lib/spread_sheet_parser/task/sheet_660_point_8kw.rb",
      "lib/spread_sheet_parser/task/sheet_578_point_2kw.rb",
      "lib/spread_sheet_parser/task/sheet_693kw.rb",
      "lib/spread_sheet_parser/task/sheet_590kw.rb",
      "lib/spread_sheet_parser/task/sheet_715kw.rb",
      "lib/spread_sheet_parser/task/sheet_705_point_6kw.rb",
      "lib/spread_sheet_parser/base.rb",
      "lib/spread_sheet_parser/mesquite.rb"
    ].each do |file|
      load file
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
