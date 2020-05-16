class Chart
  include ActiveModel::Model

  # 表示期間検索用のrangeオブジェクトを生成
  def self.get_range(time_range)
    now = Time.zone.now

    case time_range
    when 'week'
      Range.new(now.ago(1.week), now)
    when '1', '3', '6', '12'
      Range.new(now.ago(time_range.to_i.month), now)
    else
      Range.new(now.ago(100.year), now)
    end
  end
end
