class ManualController < ApplicationController

  helper ContentfulRails::MarkdownHelper

  def area
    @area = Contentful::Area.find_by(uri: params['uri']).first
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
end
