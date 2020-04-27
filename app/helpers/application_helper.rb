module ApplicationHelper
  def set_icon(user)
    user.icon && user.icon.url ? user.icon.url : 'default.png'
  end

  def set_exercise_icon(exercise)
    exercise.icon && exercise.icon.url ? exercise.icon.url(:thumb) : 'exercise_icon'
  end

  def set_body_picture1(body_status)
    body_status.picture1 && body_status.picture1.url ? body_status.picture1.url(:thumb) : 'no_image_gray_medium.png'
  end

  def set_body_picture2(body_status)
    body_status.picture2 && body_status.picture2.url ? body_status.picture2.url(:thumb) : 'no_image_gray_medium'
  end

  def set_body_picture3(body_status)
    body_status.picture3 && body_status.picture3.url ? body_status.picture3.url(:thumb) : 'no_image_gray_medium'
  end

  def format_date_time(date)
    date.strftime("%Y-%m-%d %H:%M")
  end

  def format_date(date)
    date.strftime("%Y-%m-%d")
  end
end
