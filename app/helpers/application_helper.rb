module ApplicationHelper
  def set_icon(user)
    user.icon && user.icon.url ? user.icon.url : 'default.png'
  end
end
