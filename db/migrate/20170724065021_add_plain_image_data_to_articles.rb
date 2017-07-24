class AddPlainImageDataToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :plain_image_data, :text
  end
end
