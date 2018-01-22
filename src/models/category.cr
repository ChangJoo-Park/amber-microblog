require "granite_orm/adapter/sqlite"

class Category < Granite::ORM::Base
  adapter sqlite
  table_name categorys


  # id : Int64 primary key is created for you
  field name : String
end
