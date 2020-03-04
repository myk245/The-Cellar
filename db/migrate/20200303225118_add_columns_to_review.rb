class AddColumnsToReview < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :wine_id, :integer
  end
end
