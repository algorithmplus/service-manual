require 'rich_text_renderer'

module ContentfulRenderers
  # H1 node renderer.
  class HeadingOneRenderer < RichTextRenderer::BaseBlockRenderer
    def render(node)
      "<h1 class = 'jonny'>#{render_content(node)}</h1>"
    end
  end
end
