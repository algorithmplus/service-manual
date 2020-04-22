require 'rich_text_renderer'

module ContentfulRenderers
  # H2 node renderer.
  class EntryHyperlinkRenderer < RichTextRenderer::BaseBlockRenderer
    def render(node)
      target = node['data']['target']
      type = target.content_type.id

      case type
      when 'areas'
        url = '/manual/' + target.uri
      when 'items'
        url = '/manual/' + target.section.area.uri + '/' + target.section.uri + '/' + target.uri
      when 'siteDocumentation'
        url = '/documentation/' + target.uri
      when 'home'
        url = '/'
      else
        url = target.uri
      end

      "<a href='#{url}'>#{render_content(node)}</a>"
    end
  end
end
