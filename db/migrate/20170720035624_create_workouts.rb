class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.string :name
      t.integer :time
      t.integer :intensity
      t.text :description
      t.boolean :featured, default: false

      t.timestamps
    end
  end
end
