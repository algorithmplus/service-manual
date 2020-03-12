class ManualController < ApplicationController

  helper ContentfulRails::MarkdownHelper

  def area
    @content = Contentful::Area.find_by(uri: params['uri']).first
    renderer = RichTextRenderer::Renderer.new
    @body = renderer.render(@content.body)
  end
end
