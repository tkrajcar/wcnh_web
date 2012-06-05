module Admin::PagesHelper
  def can_edit(page)
    current_user.admin || current_user == page.creator
  end
end
