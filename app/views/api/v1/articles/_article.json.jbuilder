json.extract! article, :created_at_pretty, :headline, :author, :body

json.text_image_url article.text_image_url(public: true)
json.plain_image_url article.plain_image_url(public: true)
