class CreateCircuits < ActiveRecord::Migration[5.1]
  def change
    create_table :circuits do |t|
      t.references :workout, foreign_key: true, index: true
      t.references :setup, foreign_key: true, index: true
      t.integer :sets

      t.timestamps
    end
  end
end
