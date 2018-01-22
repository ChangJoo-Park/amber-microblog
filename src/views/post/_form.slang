- if post.errors
  ul.errors
  - post.errors.each do |error|
    li = error.to_s

== form(action: "/posts/#{post.id.to_s}", method: post.id ? :patch : :post) do
  == csrf_tag
  div.form-group
  == text_field(name: "title", value: post.title, placeholder: "Title", class: "form-control")
  div.form-group
  == text_area(name: "body", content: post.body, placeholder: "Body", class: "form-control", size: "30x10")
  div.form-group
    == label(:user)
    == select_field(name: "user_id", collection: User.all.map{|user| [user.id, user.email]}, selected: post.user_id, class: "form-control")
  div.form-group
    == label(:category)
    == select_field(name: "category_id", collection: Category.all.map{|category| [category.id, category.name]}, selected: post.category_id, class: "form-control")
  div.form-group
  div.checkbox
    == label(:published) do
      == check_box(:published, checked: post.published.to_s == "1")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/posts", class: "btn btn-default btn-xs")
