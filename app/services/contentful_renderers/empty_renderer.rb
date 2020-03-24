require 'rich_text_renderer'

module ContentfulRenderers
  # H1 node renderer.
  class EmptyRenderer < RichTextRenderer::BaseBlockRenderer
    def render(node)
      ''
    end
  end
end
