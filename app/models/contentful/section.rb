module Contentful
  class Section < ContentfulModel::Base
    self.content_type_id = 'sections'

    has_one :area, class_name: "Contentful::Area"
    has_many_nested :subsections, class_name: "Contentful::Section"

    def breadcrumbs
      breads = area.breadcrumbs
      uri = fields[:uri]
      if uri.match(/^http/)
        breads << {:text => heading, :uri => uri}
      else
        breads << {:text => heading, :uri => '/manualxxx/' << uri}
      end
      return breads
    end

  end
end
