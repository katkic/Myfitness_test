class CreateBodyStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :body_statuses do |t|
      t.references :user, foreign_key: true, null: false
      t.float :body_weight, null: false
      t.float :body_fat
      t.string :picture1
      t.string :picture2
      t.string :picture3

      t.timestamps
    end
  end
end
