module Contentful
  class Item < ContentfulModel::Base
    self.content_type_id = 'items'
  end
end
