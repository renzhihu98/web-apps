json.extract! book, :id, :title, :author, :classification, :genre, :edition, :description, :image, :created_at, :updated_at
json.url book_url(book, format: :json)
