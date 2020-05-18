class AddColumnToWorkouts < ActiveRecord::Migration[5.2]
  def change
    add_column :workouts, :set, :integer, null: false, default: 0
    add_column :workouts, :max_weight, :float, null: false, default: 0
    add_column :workouts, :max_one_rm, :float, null: false, default: 0
    add_column :workouts, :total_weight, :float, null: false, default: 0
  end
end
