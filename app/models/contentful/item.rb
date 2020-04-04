module Contentful
  class Item < ContentfulModel::Base
    self.content_type_id = 'items'

    def path
      '/manual/' + section.area.uri + '/' + section.uri + '/' + uri
    end
  end
end
