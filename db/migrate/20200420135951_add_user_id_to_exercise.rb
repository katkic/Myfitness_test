class AddUserIdToExercise < ActiveRecord::Migration[5.2]
  def change
    add_reference :exercises, :user, foreign_key: true, null: false
  end
end
