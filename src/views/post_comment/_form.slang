- if post_comment.errors
  ul.errors
  - post_comment.errors.each do |error|
    li = error.to_s

== form(action: "/post_comments/#{post_comment.id.to_s}", method: post_comment.id ? :patch : :post) do
  == csrf_tag
  div.form-group
    == label(:post)
    == select_field(name: "post_id", collection: Post.all.map{|post| [post.id, post.title]}, selected: post_comment.post_id, class: "form-control")
  div.form-group
    == label(:user)
    == select_field(name: "user_id", collection: User.all.map{|user| [user.id, user.email]}, selected: post_comment.user_id, class: "form-control")
  div.form-group
  == text_area(name: "body", content: post_comment.body, placeholder: "Body", class: "form-control", size: "30x10")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/post_comments", class: "btn btn-default btn-xs")
