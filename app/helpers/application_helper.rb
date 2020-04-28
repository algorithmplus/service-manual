module ApplicationHelper
  def page_title(key)
    content_for(:page_title, I18n.t(key, scope: 'page_titles'))
  end
end
