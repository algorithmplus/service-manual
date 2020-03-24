require 'rich_text_renderer'

module ContentfulRenderers
  # H1 node renderer.
  class HeadingTwoContentsRenderer < RichTextRenderer::BaseBlockRenderer
    def render(node)
      hash = node['content'][0]['value'].hash
      "<li class='govuk-body-s'><a class='govuk-link' href='##{hash}'>#{render_content(node)}</a></li>"
    end
  end
end
