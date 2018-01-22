- if category.errors
  ul.errors
  - category.errors.each do |error|
    li = error.to_s

== form(action: "/categories/#{category.id.to_s}", method: category.id ? :patch : :post) do
  == csrf_tag
  div.form-group
  == text_field(name: "name", value: category.name, placeholder: "Name", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/categories", class: "btn btn-default btn-xs")
