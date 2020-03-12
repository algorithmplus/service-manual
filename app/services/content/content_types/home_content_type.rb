module Content::ContentTypes
  class HomeContentType < Content::ContentTypes::BaseContentType

    def content()
      @content_service.entry('home')
    end
  end
end
