require 'rich_text_renderer'

module ContentfulRenderers
  # H2 node renderer.
  class HeadingTwoRenderer < RichTextRenderer::BaseBlockRenderer
    def render(node)
      hash = node['content'][0]['value'].hash
      "<h2><a id='#{hash}'>#{render_content(node)}</a></h2>"
    end
  end
end
