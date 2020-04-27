module ApplicationHelper
  def set_icon(user)
    user.icon && user.icon.url ? user.icon.url : 'default.png'
  end

  def set_exercise_icon(exercise)
    exercise.icon && exercise.icon.url ? exercise.icon.url(:thumb) : 'exercise_icon'
  end

  def format_date_time(date)
    date.strftime("%Y-%m-%d %H:%M")
  end

  def format_date(date)
    date.strftime("%Y-%m-%d")
  end
end
