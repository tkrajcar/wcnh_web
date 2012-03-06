module ApplicationHelper
  def title(page_title)
    content_for(:page_title) { page_title }
  end
  def h1(h1)
    content_for(:page_h1) { h1 }
  end
  def title_and_h1(text)
    content_for(:page_title) { text }
    content_for(:page_h1) { text }
  end
end
