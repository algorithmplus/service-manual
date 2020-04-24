require 'rich_text_renderer'

module ContentfulRenderers
  # H2 node renderer.
  class AssetHyperlinkRenderer < RichTextRenderer::BaseBlockRenderer
    def render(node)

      attachment = node['data']['target']
      file_info = attachment.raw['fields']['file']

      GovukPublishingComponents.render("govuk_publishing_components/components/attachment", {
          attachment: {
              title: attachment.title,
              url: attachment.url,
              content_type: file_info['contentType'],
              file_size: file_info['details']['size'],
          }
      })
    end
  end
end
