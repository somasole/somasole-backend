class CreateJoinTableWorkoutTag < ActiveRecord::Migration[5.1]
  def change
    create_join_table :workouts, :tags do |t|
      t.index [:workout_id, :tag_id]
      t.index [:tag_id, :workout_id]
    end
  end
end
