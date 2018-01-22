require "granite_orm/adapter/sqlite"

class PostComment < Granite::ORM::Base
  adapter sqlite
  table_name post_comments

  belongs_to :post
  belongs_to :user
  # id : Int64 primary key is created for you
  field body : String
end
