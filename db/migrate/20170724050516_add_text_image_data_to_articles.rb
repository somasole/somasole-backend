class AddTextImageDataToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :text_image_data, :text
  end
end
