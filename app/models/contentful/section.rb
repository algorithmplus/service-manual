module Contentful
  class Section < ContentfulModel::Base
    self.content_type_id = 'sections'

    has_one :area, class_name: "Contentful::Area"
    has_many_nested :subsections, class_name: "Contentful::Section"

  end
end
