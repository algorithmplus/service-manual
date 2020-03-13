class ManualController < ApplicationController

  helper ContentfulRails::MarkdownHelper

  def area
    @area = Contentful::Area.find_by(uri: params['area_uri']).first
    renderer = RichTextRenderer::Renderer.new

    @area_body = if @area.body
                   renderer.render(@area.body)
                 else
                   ''
                 end

    @sections = if @area.sections
                  @area.sections
                else
                  []
                end
  end

  def section
    @section = Contentful::Section.find_by(uri: params['section_uri']).first
    renderer = RichTextRenderer::Renderer.new

    @section_body = if @section.body
                      renderer.render(@section.body)
                    else
                      ''
                    end

    @items = if @section.items
               @section.items
             else
               []
             end
  end
end
