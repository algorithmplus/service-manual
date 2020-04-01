ContentfulModel.configure do |config|
  config.access_token = Rails.configuration.contentful_api_key
  config.preview_access_token = Rails.configuration.contentful_preview_api_key # Optional - required if you want to use the preview API
  config.management_token = "your management token in here" # Optional - required if you want to update or create content
  config.space = Rails.configuration.contentful_space
  config.environment = "master" # Optional - defaults to 'master'
  config.default_locale = "en-US" # Optional - defaults to 'en-US'
  config.options = { # Optional
                     # Extra options to send to the Contentful::Client and Contentful::Management::Client
                     # See https://github.com/contentful/contentful.rb#configuration

                     # Optional:
                     # Use `delivery_api` and `management_api` keys to limit to what API the settings
                     # will apply. Useful because Delivery API is usually visitor facing, while Management
                     # is used in background tasks that can run much longer. For example:
                     reuse_entries: true,
                     delivery_api: {
                       timeout_connect: 3,
                       timeout_read: 6,
                       timeout_write: 20
                     },
                     management_api: {
                       timeout_connect: 3,
                       timeout_read: 6,
                       timeout_write: 20
                     }
  }
end
