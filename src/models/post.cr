require "granite_orm/adapter/sqlite"

class Post < Granite::ORM::Base
  adapter sqlite
  table_name posts

  belongs_to :user
  belongs_to :category
  has_many :post_comments

  # id : Int64 primary key is created for you
  field title : String
  field body : String
  field published : Int64
end
