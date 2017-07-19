class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :youtube_id
      t.text :description
      t.integer :duration
      t.string :title

      t.timestamps
    end
  end
end
