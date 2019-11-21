module Types
  class BookType < Types::BaseObject
    field :title, String, null: false
    field :author, String, null: false
    field :published_year, String, null: true
  end
end
