require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

class ManualController < ApplicationController

  def get_content_body (content)
      if content.body
        RichTextRenderer::Renderer.new(
          'heading-1' => ContentfulRenderers::HeadingOneRenderer
        ).render(content.body)
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

  def item
    @item = Contentful::Item.find_by(uri: params['item_uri']).first
    @item_body = get_content_body(@item)
    @last_updated_date_formatted = time_ago_in_words(@item.updated_at)
  end
end
