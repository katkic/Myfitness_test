module ApplicationHelper
  def set_image(image_obj, image_name)
    image_obj.present? ? image_obj.url : image_name
  end

  def format_date_time(date)
    date.strftime("%Y-%m-%d %H:%M")
  end

  def format_date(date)
    date.strftime("%Y-%m-%d")
  end
end
