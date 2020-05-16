class ChartsController < ApplicationController
  def index
    range = Chart.get_range(params[:range])
    @range_title = params[:range]

    @body_weight_records = BodyStatus.get_body_weight_records(current_user, range)
    @body_fat_records = BodyStatus.get_body_fat_records(current_user, range)
  end
end
