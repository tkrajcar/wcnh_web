module Admin::PagesHelper
  def can_edit(page)
    current_user.admin || current_user.name == page.author
  end
end
