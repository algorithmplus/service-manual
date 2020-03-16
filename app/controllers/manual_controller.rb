class ManualController < ApplicationController

  def get_content_body (content)
    renderer = RichTextRenderer::Renderer.new
      if content.body
        renderer.render(content.body)
      else
        ''
      end
    end

  def area
    @area = Contentful::Area.find_by(uri: params['area_uri']).first
    @sections = @area.sections || []
    @area_body = get_content_body(@area)
  end

  def section
    @section = Contentful::Section.find_by(uri: params['section_uri']).first
    @items = @section.items || []
    @section_body = get_content_body(@section)
  end
end
