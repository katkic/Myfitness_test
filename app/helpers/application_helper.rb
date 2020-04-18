module ApplicationHelper
  def set_icon(user)
    user.icon && user.icon.url ? user.icon.url : 'default.png'
  end

  def format_date_time(date)
    date.strftime("%Y-%m-%d %H:%M")
  end

  def format_date(date)
    date.strftime("%Y-%m-%d")
  end
end
