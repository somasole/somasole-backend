class CreateMovements < ActiveRecord::Migration[5.1]
  def change
    create_table :movements do |t|
      t.references :circuit, foreign_key: true, index: true
      t.integer :time
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
