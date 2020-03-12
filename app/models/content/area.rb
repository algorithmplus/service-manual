module Content
  class Area < Contentful::Entry

    def breadcrumb_uri
      uri = fields[:uri]
      if uri.match(/^http/)
        uri
      else
        '/manual/' << uri
      end

    end
  end
end
