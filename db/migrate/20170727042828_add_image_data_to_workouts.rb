class AddImageDataToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_column :workouts, :image_data, :text
  end
end
