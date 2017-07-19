class CreateWorkoutTags < ActiveRecord::Migration[5.1]
  def change
    create_table :workout_tags do |t|
      t.references :workout, index: true
      t.string :name

      t.timestamps
    end

    add_foreign_key :workout_tags, :workout_workouts, column: :workout_id
  end
end
