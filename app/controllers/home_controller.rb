class HomeController < ApplicationController
  def index
    client = Contentful::Client.new(
      space: Settings.contentful.space_id, # This is the space ID. A space is like a project folder in Contentful terms
      access_token: Settings.contentful.access_token, # This is the access token for this space. Normally you get both ID and the token in the Contentful web app
    )

    # This API call will request an entry with the specified ID from the space defined at the top, using a space-specific access token.
    entry = client.entry("RGymUOmISLh8Hwspj0Rpa")
    renderer = RichTextRenderer::Renderer.new

    render inline: renderer.render(entry.fields[:content])
  end
end
