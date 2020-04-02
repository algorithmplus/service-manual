require 'action_view'
require 'action_view/helpers'
include ActionView::Helpers::DateHelper

class ManualController < ApplicationController

  def get_contents(content)
    if content.body
      RichTextRenderer::Renderer.new(
          'document' => RichTextRenderer::DocumentRenderer,
          'heading-1' => ContentfulRenderers::EmptyRenderer,
          'heading-2' => ContentfulRenderers::HeadingTwoContentsRenderer,
          'heading-3' => ContentfulRenderers::EmptyRenderer,
          'heading-4' => ContentfulRenderers::EmptyRenderer,
          'heading-5' => ContentfulRenderers::EmptyRenderer,
          'heading-6' => ContentfulRenderers::EmptyRenderer,
          'blockquote' => ContentfulRenderers::EmptyRenderer,
          'hyperlink' => ContentfulRenderers::EmptyRenderer,
          'paragraph' => ContentfulRenderers::EmptyRenderer,
          'list-item' => ContentfulRenderers::EmptyRenderer,
          'ordered-list' => ContentfulRenderers::EmptyRenderer,
          'unordered-list' => ContentfulRenderers::EmptyRenderer,
          'embedded-entry-block' => ContentfulRenderers::EmptyRenderer,
          'embedded-asset-block' => ContentfulRenderers::EmptyRenderer,
          'asset-hyperlink' => ContentfulRenderers::EmptyRenderer,
          'hr' => ContentfulRenderers::EmptyRenderer,
          'text' => RichTextRenderer::TextRenderer,
          'bold' => ContentfulRenderers::EmptyRenderer,
          'code' => ContentfulRenderers::EmptyRenderer,
          'italic' => ContentfulRenderers::EmptyRenderer,
          'underline' => ContentfulRenderers::EmptyRenderer
      ).render(content.body)
    else
      ''
    end
  end

  def get_content_body (content)
    if content.body
      RichTextRenderer::Renderer.new(
          'heading-2' => ContentfulRenderers::HeadingTwoRenderer
      ).render(content.body)
    else
      ''
    end
  end

  def area
    if params['area_uri']
      @area = Contentful::Area.find_by(uri: params['area_uri']).first
    elsif params['area_id']
      ContentfulModel.use_preview_api = true
      @area = Contentful::Area.find_by(id: params['area_id']).first
    end

    @sections = @area.sections || []
    @area_body = get_content_body(@area)
  end

  def section
    if params['section_uri']
      @section = Contentful::Section.find_by(uri: params['section_uri']).first
    elsif params['section_id']
      ContentfulModel.use_preview_api = true
      @section = Contentful::Section.find_by(id: params['section_id']).first
    end

    @items = @section.items || []
    @section_body = get_content_body(@section)
  end

  def item
    if params['item_uri']
      @item = Contentful::Item.find_by(uri: params['item_uri']).first
      @section = Contentful::Section.find(@item.section.id)
    elsif params['item_id']
      ContentfulModel.use_preview_api = true
      @item = Contentful::Item.find_by(id: params['item_id']).first
      @section = Contentful::Section.find(@item.section.id)
    end

    @area_breadcrumb = [@section.area.heading, '/manual/' + @section.area.uri]
    @section_breadcrumb = [@section.heading, '/manual/' + @section.area.uri + '/' + @section.uri]

    @item_body = get_content_body(@item)
    @contents = get_contents(@item)
    @last_updated_date_formatted = time_ago_in_words(@item.updated_at)
  end
end
