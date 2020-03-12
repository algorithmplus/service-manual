module Contentful
  class Area < ContentfulModel::Base

    self.content_type_id = 'areas'

    has_one :home, class_name: "Contentful::Home"

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
