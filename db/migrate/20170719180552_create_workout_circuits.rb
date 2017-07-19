class CreateWorkoutCircuits < ActiveRecord::Migration[5.1]
  def change
    create_table :workout_circuits do |t|
      t.references :workout, index: true
      t.integer :sets

      t.timestamps
    end

    add_foreign_key :workout_circuits, :workout_workouts, column: :workout_id
  end
end
