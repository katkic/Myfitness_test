class AddSelfIntroductionToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :self_introduction, :text
  end
end
