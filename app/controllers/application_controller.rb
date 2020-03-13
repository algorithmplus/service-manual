class ApplicationController < ActionController::Base
  include GaTrackingHelper

  before_action :set_raven_context

  def url_parser
    @url_parser ||= UrlParser.new(request.referer, request.host)
  end

  private

  def track_event(event_key, event_value, scope = 'events')
    event_label = I18n.t(event_key, scope: scope)

    track_events(
      [
        {
          key: event_key,
          label: event_label,
          value: event_value
        }
      ]
    )
  end

  def track_events(props = [])
    TrackingService.new(client_tracking_data: client_tracking_data).track_events(props: props)
  rescue TrackingService::TrackingServiceError
    nil
  end

  def set_raven_context
    return unless Rails.configuration.sentry_dsn.present?

    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
