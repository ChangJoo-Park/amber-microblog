div.row
  div.col-sm-11
    h2 Categories
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/categories/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Actions
    tbody
    - categories.each do |category|
      tr
        td = category.name
        td
          span
            == link_to("read", "/categories/#{category.id}", class: "btn btn-success btn-xs")
            == link_to("edit", "/categories/#{category.id}/edit", class: "btn btn-success btn-xs")
            == link_to("delete", "/categories/#{ category.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
