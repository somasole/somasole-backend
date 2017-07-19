class CreateWorkoutWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workout_workouts do |t|
      t.string :name
      t.integer :time
      t.integer :intensity
      t.text :description

      t.timestamps
    end
  end
end
