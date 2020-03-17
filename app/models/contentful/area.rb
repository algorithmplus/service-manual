module Contentful
  class Area < ContentfulModel::Base

    self.content_type_id = 'areas'

    has_one :home, class_name: "Contentful::Home"

    def breadcrumbs
      breads = [   {:text => 'Home', :uri => '/'} ]
      uri = fields[:uri]
      if uri.match(/^http/)
        breads << {:text => heading, :uri => uri}
      else
        breads << {:text => heading, :uri => '/manual/' << uri}
      end
        return breads
    end
  end
end
