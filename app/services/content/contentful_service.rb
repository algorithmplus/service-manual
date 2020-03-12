require 'redcarpet'
require 'contentful'

module Content
  class ContentfulService
    attr_reader :api_key, :space

    API_ENDPOINT = 'http://localhost:1337/'.freeze
    ResponseError = Class.new(StandardError)
    APIError = Class.new(StandardError)

    def initialize(
      api_key: Rails.configuration.contentful_api_key,
      space: Rails.configuration.contentful_space
    )
      @space = space
      @api_key = api_key


      @client = Contentful::Client.new(
        space: @space,  # This is the space ID. A space is like a project folder in Contentful terms
        access_token:  @api_key,  # This is the access token for this space. Normally you get both ID and the token in the Contentful web app
        reuse_entries: true,
        entry_mapping: {
          'home' => Content::Home,
          'areas' => Content::Area,
          'sections' => Content::Section,
          'items' => Content::Item
        }
      )
    end

    def entry(content_type_id)
      # puts @client.entries(content_type: content_type_id, include: 1).to_yaml
      @client.entries(content_type: content_type_id, include: 1)
    end

    def content_as_hash(path)
      JSON.parse(content(path))
    end

    def content(path)
      return {} unless api_key
      uri = build_uri(path: path, options: {})
      response_body(uri)
    end

    def health_check
      uri = build_uri(path: 'ping')
      JSON.parse(response_body(uri))
    end

    private

    def response_body(uri)
      Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https', read_timeout: 5) do |http|
        request = Net::HTTP::Get.new(uri)
        request['Content-Type'] = 'application/json; charset=UTF-8'
        # request['Authorization'] = authorization
        response = http.request(request)
        raise ResponseError, "#{response.code} - #{response.message}" unless response.is_a?(Net::HTTPSuccess)

        response.body
      end
    rescue StandardError => e
      Rails.logger.error("Content Service API error: #{e.inspect}")
      raise APIError, e
    end

    def build_uri(path:, options: {})
      build_uri = URI.join(API_ENDPOINT, path)
      # build_uri.query = URI.encode_www_form(query_values(options))
      build_uri
    end

    def query_values(options)
      {
        api_key: api_key,
      }.reject { |_k, v| v.blank? }
    end
  end
end
