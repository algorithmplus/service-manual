require 'rich_text_renderer'

module ContentfulRenderers
  # H1 node renderer.
  class HeadingTwoRenderer < RichTextRenderer::BaseBlockRenderer
    def render(node)
      hash = node['content'][0]['value'].hash
      "<h2 class = 'jonny'><a name = '#{hash}'>#{render_content(node)}</a></h2>"
    end
  end
end
