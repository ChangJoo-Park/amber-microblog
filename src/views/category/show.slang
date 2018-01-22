h1 Show Category
p = category.name
p
  == link_to("back", "/categories", class: "btn btn-success btn-xs")
  == link_to("edit", "/categories/#{category.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/categories/#{category.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
